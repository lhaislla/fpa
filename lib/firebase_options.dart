// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
    apiKey: 'AIzaSyAYfLL2v35qpgzP9D9xU1rtLgYOUtbx0eE',
    appId: '1:247669622807:web:0026aa4ef773224fb2b452',
    messagingSenderId: '247669622807',
    projectId: 'fpa2024-ef00d',
    authDomain: 'fpa2024-ef00d.firebaseapp.com',
    storageBucket: 'fpa2024-ef00d.appspot.com',
    measurementId: 'G-GN97SKZ20K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_EuUcp6er1iCRHIeX2izauTGOKR96sh4',
    appId: '1:247669622807:android:5b50eeb6128028b2b2b452',
    messagingSenderId: '247669622807',
    projectId: 'fpa2024-ef00d',
    storageBucket: 'fpa2024-ef00d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBY4zF-1_ichkTPu166_NI1ZvOxOL5Wrew',
    appId: '1:247669622807:ios:e804e1cc538df2f7b2b452',
    messagingSenderId: '247669622807',
    projectId: 'fpa2024-ef00d',
    storageBucket: 'fpa2024-ef00d.appspot.com',
    iosBundleId: 'com.example.fpa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBY4zF-1_ichkTPu166_NI1ZvOxOL5Wrew',
    appId: '1:247669622807:ios:e804e1cc538df2f7b2b452',
    messagingSenderId: '247669622807',
    projectId: 'fpa2024-ef00d',
    storageBucket: 'fpa2024-ef00d.appspot.com',
    iosBundleId: 'com.example.fpa',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAYfLL2v35qpgzP9D9xU1rtLgYOUtbx0eE',
    appId: '1:247669622807:web:a8b29f0ce7094625b2b452',
    messagingSenderId: '247669622807',
    projectId: 'fpa2024-ef00d',
    authDomain: 'fpa2024-ef00d.firebaseapp.com',
    storageBucket: 'fpa2024-ef00d.appspot.com',
    measurementId: 'G-WR0ME3B2PK',
  );
}