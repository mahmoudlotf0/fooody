import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_components.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit getObject(BuildContext context) => BlocProvider.of(context);

  bool showPassword = false;

  void showOrHidePassword() {
    showPassword = !showPassword;
    emit(ShowOrHidePassword());
  }

  //*------------------------- FireBase -------------------
  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      )
          .then((value) {
        print(value.user?.email);
        print(value.user?.uid);
        emit(SignUpSuccefully());
      });
    } on FirebaseAuthException catch (errro) {
      if (errro.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (errro.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(SignUpError(errro.code.toString()));
    } catch (e) {
      print(e);
    }
  }

  Future login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      )
          .then((value) {
        emit(LoginSuccefully());
        print('-------------------------------------------------------');
      }).catchError((error) {
        emit(LoginError(error.toString()));
        print(error);
      });
    } catch (error) {
      print(error.toString());
    }
  }
}
