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
    apiKey: 'AIzaSyBUVGbD6N9ERUMR-ruD-WDfl6KCkhuBrqU',
    appId: '1:750086629494:web:d66471f561294b54e91757',
    messagingSenderId: '750086629494',
    projectId: 'chat-app-4ada7',
    authDomain: 'chat-app-4ada7.firebaseapp.com',
    storageBucket: 'chat-app-4ada7.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjdg6J76Q9QyemWRbhfxBBX60sC5dsy_0',
    appId: '1:750086629494:android:936f6e7f59bb13bee91757',
    messagingSenderId: '750086629494',
    projectId: 'chat-app-4ada7',
    storageBucket: 'chat-app-4ada7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUt2n2jeaZoFHsqfl6Gj9-CyRHiZhg-rE',
    appId: '1:750086629494:ios:83171ad0c4e1d808e91757',
    messagingSenderId: '750086629494',
    projectId: 'chat-app-4ada7',
    storageBucket: 'chat-app-4ada7.firebasestorage.app',
    iosBundleId: 'com.example.chatApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUt2n2jeaZoFHsqfl6Gj9-CyRHiZhg-rE',
    appId: '1:750086629494:ios:83171ad0c4e1d808e91757',
    messagingSenderId: '750086629494',
    projectId: 'chat-app-4ada7',
    storageBucket: 'chat-app-4ada7.firebasestorage.app',
    iosBundleId: 'com.example.chatApp2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUVGbD6N9ERUMR-ruD-WDfl6KCkhuBrqU',
    appId: '1:750086629494:web:91e03b853ba56604e91757',
    messagingSenderId: '750086629494',
    projectId: 'chat-app-4ada7',
    authDomain: 'chat-app-4ada7.firebaseapp.com',
    storageBucket: 'chat-app-4ada7.firebasestorage.app',
  );

}