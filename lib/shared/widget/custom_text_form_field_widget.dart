import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? suffixIcon;
  const CustomTextFormFieldWidget({super.key,required this.hintText , required this.controller, this.isPassword = false,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          color: AppColors.grey
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
          suffixIcon: suffixIcon,
          border: InputBorder.none
        ),
        obscureText: isPassword,
      ),
    );
  }
}
