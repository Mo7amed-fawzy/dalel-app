import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

void checkAuthenticationChanges() {
  // بتشك الاول علي ال authentication هنا
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });
}
