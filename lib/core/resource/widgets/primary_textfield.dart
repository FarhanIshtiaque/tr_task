
import 'package:flutter/material.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/text_styles.dart';


class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    this.controller,
    this.fillColor = AppColors.natural7,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType,
    this.suffixIcon,
    this.hintText,
    this.prefixIcon,
    this.maxLines = 1,
  }) : super(key: key);
  final TextEditingController? controller;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      cursorColor: AppColors.gray500,
   //   style: bodyMedium14.copyWith(color: AppColors.gray500),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor:
            MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? AppColors.gray500 : AppColors.gray200),
        suffixIconColor:
            MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? AppColors.gray500 : AppColors.gray200),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
      hintStyle: AppTextStyle.caption,
      //  hintStyle: bodyMedium14.copyWith(color: AppColors.gray200),
        contentPadding: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.gray100, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.gray500, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const   BorderSide(   width: 0,
          style: BorderStyle.none,),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error300, width: 1.0),
        ),
      ),
    );
  }
}
