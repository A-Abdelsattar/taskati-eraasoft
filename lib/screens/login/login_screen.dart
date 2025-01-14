import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/screens/login/widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(height: 50.h,),
            Image.asset("assets/images/splash_logo.png",width: 101.w,height: 101.h,),
            SizedBox(height: 60.h,),
            Text("Login",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp
            ),),
            SizedBox(height: 8.h,),
            Text("Login to your account",style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.grayColor
            ),),
           SizedBox(height: 32.h,),
           const LoginForm()
          ],
        ),
      )
    );
  }
}
