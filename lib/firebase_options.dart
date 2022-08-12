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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqU55NJwuSaJdUaBeIELPq80703iYh-IE',
    appId: '1:681251195886:android:b26b8f092f240fcf0f9cff',
    messagingSenderId: '681251195886',
    projectId: 'exor-log-ac156',
    storageBucket: 'exor-log-ac156.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHJ5Ynjd_zSUJlsvkOyvGiGchZoJ8VhLE',
    appId: '1:681251195886:ios:8085e6a84f8524c00f9cff',
    messagingSenderId: '681251195886',
    projectId: 'exor-log-ac156',
    storageBucket: 'exor-log-ac156.appspot.com',
    androidClientId: '681251195886-8jp63r7ufl8eg0kepr88oohri7sbf7p5.apps.googleusercontent.com',
    iosClientId: '681251195886-stp14iaf4lfkal502csahekci6nda0j2.apps.googleusercontent.com',
    iosBundleId: 'com.redting.devteam.exerLogRevamp',
  );
}