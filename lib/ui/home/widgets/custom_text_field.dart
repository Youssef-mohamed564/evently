import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  TextStyle? hintStyle;
  String? lableText;
  TextStyle? lableStyle;
  Color? borderColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  CustomTextField(
      {super.key,
      this.borderColor,
      this.hintText,
      this.hintStyle,
      this.lableText,
      this.lableStyle,
      this.prefixIcon,
      this.suffixIcon,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primaryLight,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: borderColor ?? AppColor.greyColor, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: borderColor ?? AppColor.greyColor, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: borderColor ?? AppColor.greyColor, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: borderColor ?? AppColor.greyColor, width: 1)),
          hintText: hintText,
          hintStyle: hintStyle ?? AppStylse.medium16grey,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: lableText,
          labelStyle: lableStyle
      ),
    );
  }
}
