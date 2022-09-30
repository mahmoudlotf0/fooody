import 'package:flutter/material.dart';
import 'package:foody/core/helpers/resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/helpers/resources/style_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final Widget? label;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final Widget? suffixIconButton;
  final Widget? prefixIcon;
  final bool? isPassword;
  final TextStyle? textStyle;
  final String? valueKey;
  final String? Function(String? val)? validate;
  final String? Function(String? val)? onFieldSubmitted;

  final String? Function(String? val)? onSave;
  final Function()? onTap;
  const CustomTextFieldWidget({
    Key? key,
    this.onFieldSubmitted,
    this.label,
    required this.controller,
    this.onTap,
    this.textStyle,
    required this.hintText,
    this.suffixIconButton,
    this.prefixIcon,
    this.textInputType,
    this.isPassword = false,
    this.valueKey,
    this.validate,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: TextFormField(
        cursorColor: ColorManager.primary,
        onTap: onTap,
        onSaved: onSave,
        validator: validate,
        onFieldSubmitted: onFieldSubmitted,
        key: ValueKey(valueKey),
        obscureText: isPassword!,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintStyle: getRegularStyle(color: ColorManager.black, fontsize: 15),
          suffixIcon: suffixIconButton,
          filled: true,
          fillColor: ColorManager.grey,
          label: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ColorManager.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ColorManager.red,
            ),
          ),
        ),
      ),
    );
  }
}
