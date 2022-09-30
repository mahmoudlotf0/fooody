import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/helpers/resources/style_manager.dart';

import '../helpers/resources/color_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String lable;

  const CustomButtonWidget(
      {required this.onPressed, required this.lable, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: ColorManager.primary,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: AutoSizeText(
          lable,
          style: getBoldStyle(
            color: ColorManager.white,
            fontsize: 18,
          ),
        ),
      ),
    );
  }
}
