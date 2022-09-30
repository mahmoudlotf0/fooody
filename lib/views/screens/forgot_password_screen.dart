import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/components/custom_button_widget.dart';
import 'package:foody/core/components/custom_form_field.dart';
import '../../core/helpers/resources/color_manager.dart';
import '../../core/helpers/resources/style_manager.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              AutoSizeText(
                'Forgot password',
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontsize: 35,
                ),
              ),
              SizedBox(height: 8.h),
              AutoSizeText(
                'Please enter your email address. You will receive a link to create a new password via email.',
                style: getBoldStyle(
                  color: ColorManager.darkGrey,
                  fontsize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              CustomTextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Your email',
              ),
              CustomButtonWidget(
                onPressed: () {},
                lable: 'Send',
              )
            ],
          ),
        ),
      ),
    );
  }
}
