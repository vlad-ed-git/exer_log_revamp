import 'package:exer_log_revamp/features/splash/di/splash_di.dart' as splash_di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'firebase_options.dart';

class MainInit {
  static init() async {
    await _initFirebase();
    _initDependencies();
  }

  static void _initDependencies() {
    try {
      splash_di.init();
    } catch (e) {
      if (kDebugMode) {
        print("===== _initDependencies $e =====");
      }
    }
  }

  static Future _initFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      if (kDebugMode) {
        print("_initFirebase $e");
      }
    }
  }
}
