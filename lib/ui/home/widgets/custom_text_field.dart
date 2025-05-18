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
  int? minLines;
  TextEditingController? controller;
  String? Function(String?)? validator;
  CustomTextField(
      {super.key,
        this.controller,
      this.borderColor,
      this.hintText,
      this.hintStyle,
      this.lableText,
      this.lableStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.minLines,
        this.validator
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(validator: validator,
      minLines: minLines,maxLines: 10,
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
              borderSide: const BorderSide(
                  color: Colors.red , width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: borderColor ?? AppColor.greyColor, width: 1)),
          hintText: hintText,
          hintStyle: hintStyle ?? AppStylse.medium16grey,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: lableText,
          labelStyle: lableStyle,

      ),
    );
  }
}
