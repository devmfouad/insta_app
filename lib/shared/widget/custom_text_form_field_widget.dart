import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool expanded;
  final Widget? suffixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  const CustomTextFormFieldWidget({super.key,required this.hintText , required this.controller, this.isPassword = false,this.suffixIcon,this.maxLines = 1,this.keyboardType = TextInputType.text,this.expanded = false,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration:  BoxDecoration(
          color: AppColors.grey
      ),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
          suffixIcon: suffixIcon,
          border: InputBorder.none
        ),
        obscureText: isPassword,
        keyboardType: keyboardType,
        expands: expanded,
      ),
    );
  }
}
