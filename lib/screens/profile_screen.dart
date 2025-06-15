
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _selectDate(BuildContext context, DateTime? initialDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != initialDate) {
      await _firestore.collection('users').doc(widget.user.uid).update({
        'dateOfBirth': Timestamp.fromDate(picked),
      });
      setState(() {}); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF2196F3),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => authService.signOut(),
            ),
          ),
        ),
        title: Text('Profile', style: GoogleFonts.poppins(color: const Color(0xFF2196F3), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: _firestore.collection('users').doc(widget.user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Không tìm thấy dữ liệu người dùng.'));
          }

          final userData = snapshot.data!.data()!;
          final displayName = userData['displayName'] ?? 'N/A';
          final email = userData['email'] ?? 'N/A';
          final photoURL = userData['photoURL'];
          final dateOfBirthTimestamp = userData['dateOfBirth'] as Timestamp?;
          final DateTime? dob = dateOfBirthTimestamp?.toDate();

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: photoURL != null ? NetworkImage(photoURL) : null,
                  child: photoURL == null ? Icon(Icons.person, size: 60, color: Colors.grey[400]) : null,
                ),
                const SizedBox(height: 40),
                _buildInfoField('Name', displayName),
                const SizedBox(height: 20),
                _buildInfoField('Email', email),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(context, dob),
                  child: _buildInfoField(
                    'Date of Birth',
                    dob != null ? DateFormat('dd/MM/yyyy').format(dob) : 'Chưa cập nhật',
                    showDropdownIcon: true,
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => authService.signOut(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text('Back', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoField(String label, String value, {bool showDropdownIcon = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
              ),
              if (showDropdownIcon)
                Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
            ],
          ),
        ),
      ],
    );
  }
}