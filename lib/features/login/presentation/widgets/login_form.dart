import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/extentions.dart';
import 'package:taskati_app/core/utils/styles.dart';

import '../../../bottom_nav_bar/bottom_nav_bar_screen.dart';
import '../../logic/login_cubit.dart';
import 'custom_text_form_field.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginErrorState){
          showDialog(context: context, builder:(context)=> AlertDialog(
            content: Text(state.error),
          ));
        }else if(state is LoginSuccessState){
          context.pushAndRemoveUntil(BottomNavBarScreen());
        }
      },
      child: Form(
          key: formKey
          , child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email", style: TextStyles.font16Medium,),
            SizedBox(height: 12.h,),
            CustomTextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Email is required";
                  }
                }
                , hintText: "example@example.com"),
            SizedBox(height: 16.h,),
            Text("Password", style: TextStyles.font16Medium,),
            SizedBox(height: 12.h,),
            CustomTextFormField(
                controller: passwordController,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password is required";
                  }
                }
                , hintText: "Password"),
            SizedBox(height: 24.h,),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state is LoginLoadingState? Center(child: CircularProgressIndicator()):InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                         email:  emailController.text,password:  passwordController.text);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14.5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.mainColor
                    ),
                    child: Center(child: Text(
                        "login".tr(), style: TextStyles.font16Medium.copyWith(
                      color: Colors.white,
                    )
                    ),

                    ),
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
