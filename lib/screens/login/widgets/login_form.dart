import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/styles.dart';
import 'package:taskati_app/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:taskati_app/screens/home/home_screen.dart';

import 'custom_text_form_field.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
    key: formKey
    ,child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email",style:TextStyles.font16Medium,),
          SizedBox(height: 12.h,),
          CustomTextFormField(
          validator: (value){
            if(value!.trim().isEmpty){
              return "Email is required";
            }
          }
          ,hintText: "example@example.com"),
          SizedBox(height: 16.h,),
          Text("Password",style: TextStyles.font16Medium,),
          SizedBox(height: 12.h,),
          CustomTextFormField(
            isPassword: true,
              validator: (value){
                if(value!.isEmpty){
                  return "password is required";
                }
              }
          ,hintText: "Password"),
          SizedBox(height: 24.h,),
          InkWell(
            onTap: (){
              if(formKey.currentState!.validate()) {
                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) =>const BottomNavBarScreen()), (
                      route) => false,);
              }},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color:AppColors.mainColor
              ),
              child: Center(child: Text("Login",style: TextStyles.font16Medium.copyWith(
                color: Colors.white,
              )
              ),

              ),
            ),
          )
        ],
      ),
    ));
  }
}
