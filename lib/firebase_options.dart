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
    apiKey: 'AIzaSyCUmiIjgsadBWJrsx4PF8hpGM92j64wG0w',
    appId: '1:17666685878:web:95b55658bd596433715f17',
    messagingSenderId: '17666685878',
    projectId: 'project1-dc845',
    authDomain: 'project1-dc845.firebaseapp.com',
    storageBucket: 'project1-dc845.firebasestorage.app',
    measurementId: 'G-LNX72S3SJX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD16hZtUG5kuLvhfjlSzIX18ocEIjXiUI4',
    appId: '1:17666685878:android:5ca73952c3ef5751715f17',
    messagingSenderId: '17666685878',
    projectId: 'project1-dc845',
    storageBucket: 'project1-dc845.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtyfcrnyugs0hUfjbd1JqnHBmBmiKkE7E',
    appId: '1:17666685878:ios:279ad8d7611c922a715f17',
    messagingSenderId: '17666685878',
    projectId: 'project1-dc845',
    storageBucket: 'project1-dc845.firebasestorage.app',
    iosBundleId: 'com.example.project1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtyfcrnyugs0hUfjbd1JqnHBmBmiKkE7E',
    appId: '1:17666685878:ios:279ad8d7611c922a715f17',
    messagingSenderId: '17666685878',
    projectId: 'project1-dc845',
    storageBucket: 'project1-dc845.firebasestorage.app',
    iosBundleId: 'com.example.project1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUmiIjgsadBWJrsx4PF8hpGM92j64wG0w',
    appId: '1:17666685878:web:eb39b65878b9ab99715f17',
    messagingSenderId: '17666685878',
    projectId: 'project1-dc845',
    authDomain: 'project1-dc845.firebaseapp.com',
    storageBucket: 'project1-dc845.firebasestorage.app',
    measurementId: 'G-Y16YHWQ4T5',
  );
}