import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foody/core/helpers/resources/assets_manager.dart';
import 'package:foody/core/helpers/resources/color_manager.dart';
import 'package:foody/core/helpers/resources/route_manager.dart';
import 'package:foody/core/helpers/resources/style_manager.dart';
import 'package:foody/core/viewmodels/cubit/app_cubit.dart';
import '../../core/components/app_components.dart';
import '../../core/components/custom_button_widget.dart';
import '../../core/components/custom_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {
              if (state is LoginError) {
                Fluttertoast.showToast(msg: state.error);
              }
              if (state is LoginSuccefully) {
                Fluttertoast.showToast(msg: 'Login Succefully');
              }
            },
            builder: (context, state) {
              AppCubit appCubit = AppCubit.getObject(context);
              return Form(
                key: formKeyForLogin,
                child: Column(
                  children: [
                    _headerSection(),
                    CustomTextFieldWidget(
                      onFieldSubmitted: (value) {
                        loginValidatorActivation();
                        return '';
                      },
                      controller: loginEmailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validate: (value) {
                        return validationForEmail(value!);
                      },
                    ),
                    CustomTextFieldWidget(
                      controller: loginPasswordController,
                      hintText: 'Password',
                      onFieldSubmitted: (value) {
                        loginValidatorActivation();
                        return '';
                      },
                      isPassword: appCubit.showPassword ? false : true,
                      textInputType: TextInputType.visiblePassword,
                      validate: (value) {
                        return validationForPassword(value!);
                      },
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
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.forgotPasswordScreen);
                      },
                      child: AutoSizeText(
                        'Forgot your password?',
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontsize: 15,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    CustomButtonWidget(
                      onPressed: () async {
                        loginValidatorActivation();
                        await appCubit.login();
                      },
                      lable: 'Login',
                    ),
                    _footer(context),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLogo({
    required Color backgroundColor,
    required String lable,
    required String image,
    required Function() onPressed,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 30.h,
          child: Row(
            children: [
              Image.asset(
                image,
                width: 25.w,
                height: 25.w,
                color: ColorManager.white,
              ),
              SizedBox(width: 10.w),
              AutoSizeText(
                lable,
                style: getBoldStyle(
                  color: ColorManager.white,
                  fontsize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSection() {
    return Column(
      children: [
        Container(
          height: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            image: const DecorationImage(
                image: AssetImage(ImageAssets.loginImage), fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 15.h),
        AutoSizeText(
          'Welcome back',
          style: getBoldStyle(
            color: ColorManager.black,
            fontsize: 35,
          ),
        ),
        SizedBox(height: 8.h),
        AutoSizeText(
          'Login to you account',
          style: getBoldStyle(
            color: ColorManager.darkGrey,
            fontsize: 15,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _footer(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          'Or',
          style: getBoldStyle(color: ColorManager.darkGrey, fontsize: 15),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            _buildLogo(
              backgroundColor: ColorManager.blue,
              lable: 'Facebook',
              image: ImageAssets.facebookLogo,
              onPressed: () {},
              //TODO: Create Facebook Login Method
            ),
            _buildLogo(
              backgroundColor: ColorManager.red,
              lable: 'Google',
              image: ImageAssets.googleLogo,
              onPressed: () {
                //TODO: Create Google Login Method
              },
            )
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'Don\'t have an account?',
              style: getBoldStyle(
                color: ColorManager.darkGrey,
                fontsize: 15,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.signUpScreen);
              },
              child: AutoSizeText(
                'Sign up',
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontsize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
