// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC_jP4SGp8knA6eoTLWsSexiQjXCG7RrpY',
    appId: '1:559967414499:web:d4ae8e0c99f3f1e1ad3dd6',
    messagingSenderId: '559967414499',
    projectId: 'task-management-apps-61e5f',
    authDomain: 'task-management-apps-61e5f.firebaseapp.com',
    storageBucket: 'task-management-apps-61e5f.appspot.com',
    measurementId: 'G-HMS849JJY6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_SH96y6_OgZWNTu-n6ZV5Kh6Tz4DVsMQ',
    appId: '1:559967414499:android:a82c889c84947163ad3dd6',
    messagingSenderId: '559967414499',
    projectId: 'task-management-apps-61e5f',
    storageBucket: 'task-management-apps-61e5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSYhLukoC59i9TivSCZiRHz9m-6GNmhLk',
    appId: '1:559967414499:ios:0c728f53c3e487a3ad3dd6',
    messagingSenderId: '559967414499',
    projectId: 'task-management-apps-61e5f',
    storageBucket: 'task-management-apps-61e5f.appspot.com',
    androidClientId: '559967414499-igk4rutih36jkttgta4esv899ftcagl9.apps.googleusercontent.com',
    iosClientId: '559967414499-58imvldrn2dc7o4ep3mvrpm3v4qfkkfs.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPertama',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSYhLukoC59i9TivSCZiRHz9m-6GNmhLk',
    appId: '1:559967414499:ios:0c728f53c3e487a3ad3dd6',
    messagingSenderId: '559967414499',
    projectId: 'task-management-apps-61e5f',
    storageBucket: 'task-management-apps-61e5f.appspot.com',
    androidClientId: '559967414499-igk4rutih36jkttgta4esv899ftcagl9.apps.googleusercontent.com',
    iosClientId: '559967414499-58imvldrn2dc7o4ep3mvrpm3v4qfkkfs.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPertama',
  );
}