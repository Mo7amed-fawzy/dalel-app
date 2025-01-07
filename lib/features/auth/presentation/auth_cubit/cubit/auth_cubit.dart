import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  bool? termsAndConditionCheckValues = false;
  bool? isPasswordVisible = false;

  createUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  updatesTermsAndConditionsCeckBox({required newValue}) {
    termsAndConditionCheckValues = newValue;
    emit(TermsAndConditionUpdateState());
  }

  void togglePasswordVisibility() {
    if (isPasswordVisible == true) {
      isPasswordVisible = false;
    } else {
      isPasswordVisible = true;
    }
    emit(TogglePasswordVisibilityState());
  }
}
