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
    apiKey: 'AIzaSyChSMhFht5apA8GB12w-xDLgUwnuJV4ZwA',
    appId: '1:824463735792:web:fb93a5cea2c5a494ed3b35',
    messagingSenderId: '824463735792',
    projectId: 'agro-9c83b',
    authDomain: 'agro-9c83b.firebaseapp.com',
    storageBucket: 'agro-9c83b.appspot.com',
    measurementId: 'G-767JERG9NL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQ01c4pAtkzOvYi5Hp95vjTC1SQDsYs88',
    appId: '1:824463735792:android:879ee23fcce28daeed3b35',
    messagingSenderId: '824463735792',
    projectId: 'agro-9c83b',
    storageBucket: 'agro-9c83b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAr-Z8Go4DdLl3V8xoVWK2B4Yz2DJVcxnY',
    appId: '1:824463735792:ios:41357d6b4882be63ed3b35',
    messagingSenderId: '824463735792',
    projectId: 'agro-9c83b',
    storageBucket: 'agro-9c83b.appspot.com',
    iosClientId: '824463735792-shf5m3ac7ukf5hpetfpuebi34fhi0q8g.apps.googleusercontent.com',
    iosBundleId: 'com.example.milagro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAr-Z8Go4DdLl3V8xoVWK2B4Yz2DJVcxnY',
    appId: '1:824463735792:ios:41357d6b4882be63ed3b35',
    messagingSenderId: '824463735792',
    projectId: 'agro-9c83b',
    storageBucket: 'agro-9c83b.appspot.com',
    iosClientId: '824463735792-shf5m3ac7ukf5hpetfpuebi34fhi0q8g.apps.googleusercontent.com',
    iosBundleId: 'com.example.milagro',
  );
}