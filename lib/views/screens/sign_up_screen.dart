import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:foody/core/components/custom_button_widget.dart';
import 'package:foody/core/components/custom_form_field.dart';
import 'package:foody/core/helpers/resources/style_manager.dart';
import 'package:foody/core/viewmodels/cubit/app_cubit.dart';

import '../../core/components/app_components.dart';
import '../../core/helpers/resources/color_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.black,
          ),
        ),
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is SignUpSuccefully) {
            Fluttertoast.showToast(msg: 'SignUp Succefully');
          }
          if (state is SignUpError) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        builder: (context, state) {
          AppCubit appCubit = AppCubit.getObject(context);
          return SingleChildScrollView(
            child: Form(
              key: formKeyForSignUp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    child: AutoSizeText(
                      'Create an account',
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontsize: 35,
                      ),
                    ),
                  ),
                  CustomTextFieldWidget(
                    controller: signUpEmailController,
                    hintText: 'Email',
                    onFieldSubmitted: (value) {
                      signUpValidatorActivation();
                      return '';
                    },
                    textInputType: TextInputType.emailAddress,
                    validate: (value) {
                      return validationForEmail(value!);
                    },
                  ),
                  CustomTextFieldWidget(
                    controller: signUpPasswordController,
                    hintText: 'Password',
                    onFieldSubmitted: (value) {
                      signUpValidatorActivation();
                      return '';
                    },
                    textInputType: TextInputType.visiblePassword,
                    isPassword: appCubit.showPassword ? false : true,
                    suffixIconButton: IconButton(
                      onPressed: () {
                        appCubit.showOrHidePassword();
                      },
                      icon: appCubit.showPassword
                          ? Icon(
                              Icons.visibility_off,
                              color: ColorManager.primary,
                            )
                          : Icon(
                              Icons.visibility,
                              color: ColorManager.primary,
                            ),
                    ),
                    validate: (value) {
                      return validationForPassword(value!);
                    },
                  ),
                  CustomButtonWidget(
                    onPressed: () async {
                      signUpValidatorActivation();
                      print(signUpEmailController.text);
                      print(signUpPasswordController.text);
                      await appCubit.signUp();
                    },
                    lable: 'Sign up',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Already have an account?',
                        style: getBoldStyle(
                          color: ColorManager.darkGrey,
                          fontsize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: AutoSizeText(
                          'Sign in',
                          style: getBoldStyle(
                            color: ColorManager.primary,
                            fontsize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
