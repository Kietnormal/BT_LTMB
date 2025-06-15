
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB7sPZwp_lD329R-ghVDhFkChOpD060TLw',
    appId: '1:1003283732629:web:28a070d450c2172679639c',
    messagingSenderId: '1003283732629',
    projectId: 'uth-smarttasks-authgg',
    authDomain: 'uth-smarttasks-authgg.firebaseapp.com',
    storageBucket: 'uth-smarttasks-authgg.firebasestorage.app',
    measurementId: 'G-H6HJ9KDNN7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyYl7sX32S8WGUhW7CkgQ7YQM87C1HMvQ',
    appId: '1:1003283732629:android:d535b2812136143679639c',
    messagingSenderId: '1003283732629',
    projectId: 'uth-smarttasks-authgg',
    storageBucket: 'uth-smarttasks-authgg.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzcEW0nc66U3KVsLUZSxk9aw2PePjgnDw',
    appId: '1:1003283732629:ios:8dfeda552dbe955d79639c',
    messagingSenderId: '1003283732629',
    projectId: 'uth-smarttasks-authgg',
    storageBucket: 'uth-smarttasks-authgg.firebasestorage.app',
    iosClientId: '1003283732629-udhoipotnlio288fdkj97muajeseqau2.apps.googleusercontent.com',
    iosBundleId: 'com.example.uthSmarttasks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzcEW0nc66U3KVsLUZSxk9aw2PePjgnDw',
    appId: '1:1003283732629:ios:8dfeda552dbe955d79639c',
    messagingSenderId: '1003283732629',
    projectId: 'uth-smarttasks-authgg',
    storageBucket: 'uth-smarttasks-authgg.firebasestorage.app',
    iosClientId: '1003283732629-udhoipotnlio288fdkj97muajeseqau2.apps.googleusercontent.com',
    iosBundleId: 'com.example.uthSmarttasks',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7sPZwp_lD329R-ghVDhFkChOpD060TLw',
    appId: '1:1003283732629:web:93889fdc49b6683779639c',
    messagingSenderId: '1003283732629',
    projectId: 'uth-smarttasks-authgg',
    authDomain: 'uth-smarttasks-authgg.firebaseapp.com',
    storageBucket: 'uth-smarttasks-authgg.firebasestorage.app',
    measurementId: 'G-156W8JTZ7X',
  );
}
