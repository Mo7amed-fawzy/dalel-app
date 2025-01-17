import 'package:dalel_app/core/functions/print_statement.dart';
import 'package:firebase_auth/firebase_auth.dart';

void checkAuthenticationChanges() {
  // بتشك الاول علي ال authentication هنا
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      printHere('User is currently signed out!');
    } else {
      printHere('User is signed in!');
    }
  });
}
