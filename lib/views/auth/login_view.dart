import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/shared/theme/app_colors.dart';
import 'package:insta_app/shared/widget/custom_text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Instagram",
              style: TextStyle(fontFamily: 'myFont-normal', fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormFieldWidget(
                hintText: "Phone Number", controller: TextEditingController()),
            SizedBox(
              height: 20,
            ),
            CustomTextFormFieldWidget(
              hintText: "Password",
              controller: TextEditingController(),
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text("Forgot Password?",style: TextStyle(color: AppColors.lightBlue),),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text("Log In"))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: Container(
                  height: 1.5.h,
                  color: Colors.grey[200],)),
                SizedBox(width: 20.w,),
                Text("OR",style: TextStyle(fontSize: 12.sp),),
                SizedBox(width: 20.w,),
                Expanded(child: Container(height: 1.5,
                  color: Colors.grey[200],)),
              ],
            ),

            TextButton(onPressed: (){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.facebook_outlined),
                SizedBox(width: 4.w,),
                Text("contine as belal")
              ],
            ),),

          ],
        ),
      ),
    );
  }
}
