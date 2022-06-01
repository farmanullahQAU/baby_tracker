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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCsTNL5j3ma4JvWY2yAq6weohCwJUCCLc',
    appId: '1:467685478802:web:dded3ad05c84c1c6b1714b',
    messagingSenderId: '467685478802',
    projectId: 'babytracker-b2930',
    authDomain: 'babytracker-b2930.firebaseapp.com',
    storageBucket: 'babytracker-b2930.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt1nJjy27JXMYIjZ4dTFA5JGPt0WY7N0o',
    appId: '1:467685478802:android:287d52d2ae5fe208b1714b',
    messagingSenderId: '467685478802',
    projectId: 'babytracker-b2930',
    storageBucket: 'babytracker-b2930.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkmri4nKR484Bqfa56iXUNqb1uQwuk0JQ',
    appId: '1:467685478802:ios:ad7ba79ca5983162b1714b',
    messagingSenderId: '467685478802',
    projectId: 'babytracker-b2930',
    storageBucket: 'babytracker-b2930.appspot.com',
    iosClientId: '467685478802-q1pgctc0sfhua1tt2d14pmd5rr24k17o.apps.googleusercontent.com',
    iosBundleId: 'com.babytracker.app',
  );
}