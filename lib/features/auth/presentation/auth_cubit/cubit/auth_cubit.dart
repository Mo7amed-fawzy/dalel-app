import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/functions/print_statement.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  bool? termsAndConditionCheckValues = false;
  bool? isPasswordVisible = false;
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await addUserProfile();
      await verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(
          SignUpFailureState(errMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(
          errMessage: 'The account already exists for that email.'));
    } else if (e.code == 'invaled-email') {
      emit(SignUpFailureState(errMessage: 'This email is invaled.'));
    } else {
      printHere(e.code);
      emit(SignUpFailureState(errMessage: e.code));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void updatesTermsAndConditionsCeckBox({required bool newValue}) {
    termsAndConditionCheckValues = newValue;
    emit(TermsAndConditionUpdateState());
  }

  void togglePasswordVisibility() {
    // if (isPasswordVisible == true) {
    //   isPasswordVisible = false;
    // } else {
    //   isPasswordVisible = true;
    // }
    isPasswordVisible = !isPasswordVisible!;
    //isPasswordVisible = !isPasswordVisible!; // handle default value
    emit(TogglePasswordVisibilityState());
  }

  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SigninFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SigninFailureState(errMessage: 'Check your Email and password!'));
      }
    } catch (e) {
      emit(
        SigninFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    printHere("Adding user profile: $emailAddress, $fristName, $lastName");

    await users.add({
      "email": emailAddress,
      "frist_name": fristName,
      "last_name": lastName,
      "password": password,
    });
  }
}
