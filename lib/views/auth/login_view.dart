import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/global.dart';
import 'package:insta_app/shared/theme/app_colors.dart';
import 'package:insta_app/shared/widget/custom_text_form_field_widget.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:insta_app/views/main_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();

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
            CustomTextFormFieldWidget(hintText: "email", controller: emailCtrl),
            SizedBox(
              height: 20,
            ),
            CustomTextFormFieldWidget(
              hintText: "Password",
              controller: pwdCtrl,
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: AppColors.lightBlue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async{
var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailCtrl.text, password: pwdCtrl.text);
if(result.user != null) {
  // Obtain shared preferences.
  prefs!.setBool("isLoggedIn", true);
  prefs!.setString("id", result.user!.uid);
  userId = result.user!.uid;


  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => mainScreen()));

}

                },
                child: Text("Log In"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 1.5.h,
                  color: Colors.grey[200],
                )),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "OR",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: Container(
                  height: 1.5,
                  color: Colors.grey[200],
                )),
              ],
            ),
            TextButton(
              onPressed: () async {
                final LoginResult result = await FacebookAuth.instance
                    .login(); // by default we request the email and the public profile
                print(result.status.name);
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));

// or FacebookAuth.i.login()
                if (result.status == LoginStatus.success) {
                  // you are logged
                  final AccessToken accessToken = result.accessToken!;
                  print(accessToken);
                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));
                } else {
                  print(result.status);
                  print(result.message);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.facebook_outlined),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text("contine as belal")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () async {
                try {
                  GoogleSignInAccount? result = await _googleSignIn.signIn();

                  if (result != null) {
                    print(result.id);
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));
                  }
                } catch (error) {
                  print(error);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.facebook_outlined),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text("google login")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
