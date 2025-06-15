// lib/services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Thêm import này

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Thêm dòng này

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // Người dùng đã hủy đăng nhập
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      final userCredential = await _auth.signInWithCredential(credential);

      // --- PHẦN MỚI ---
      // Nếu là người dùng mới, tạo document cho họ trong Firestore
      if (userCredential.additionalUserInfo?.isNewUser == true) {
        await _createUserDocument(userCredential.user!);
      }
      // --- KẾT THÚC PHẦN MỚI ---

      return userCredential;
    } catch (e) {
      print("Lỗi khi đăng nhập Google: $e");
      return null;
    }
  }

  // --- PHƯƠNG THỨC MỚI ---
  // Tạo một document trong collection 'users' với uid của người dùng
  Future<void> _createUserDocument(User user) async {
    final userDocRef = _firestore.collection('users').doc(user.uid);
    // Dùng set() để tạo mới document
    await userDocRef.set({
      'uid': user.uid,
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
      'createdAt': FieldValue.serverTimestamp(), // Lưu thời điểm tạo
      'dateOfBirth': null, // Ban đầu chưa có ngày sinh, để là null
    });
  }
  // --- KẾT THÚC PHƯƠNG THỨC MỚI ---

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}