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
    apiKey: 'AIzaSyA5D129Eeddu8EJkq4Raixqevt-_Mc_Sbk',
    appId: '1:958301721186:web:e88ceacc731303e868773b',
    messagingSenderId: '958301721186',
    projectId: 'first-app-7161c',
    authDomain: 'first-app-7161c.firebaseapp.com',
    databaseURL: 'https://first-app-7161c-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-7161c.appspot.com',
    measurementId: 'G-BX1QWB11TW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_mv7sqJxjpaz5Pe70wM4WP3mzYLRhVuE',
    appId: '1:958301721186:android:02f27ba9f8f55fb168773b',
    messagingSenderId: '958301721186',
    projectId: 'first-app-7161c',
    databaseURL: 'https://first-app-7161c-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-7161c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFgsAYWM6eCL1UsyRmSqHls2Aokia-PmA',
    appId: '1:958301721186:ios:8215717b96b9fffb68773b',
    messagingSenderId: '958301721186',
    projectId: 'first-app-7161c',
    databaseURL: 'https://first-app-7161c-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-7161c.appspot.com',
    iosBundleId: 'com.example.fasumApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFgsAYWM6eCL1UsyRmSqHls2Aokia-PmA',
    appId: '1:958301721186:ios:f27ac5ce11b9b33468773b',
    messagingSenderId: '958301721186',
    projectId: 'first-app-7161c',
    databaseURL: 'https://first-app-7161c-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-7161c.appspot.com',
    iosBundleId: 'com.example.fasumApp.RunnerTests',
  );
}
