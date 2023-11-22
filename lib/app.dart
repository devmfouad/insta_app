import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/global.dart';
import 'package:insta_app/views/auth/login_view.dart';
import 'package:insta_app/views/auth/register_view.dart';
import 'package:insta_app/views/main_Screen.dart';



class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          home: userId == null ? LoginView() : mainScreen(),
        );
      },
    );


  }
}
