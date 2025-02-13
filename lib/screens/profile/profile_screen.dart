import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/styles.dart';
import 'package:taskati_app/screens/all_tasks/widgets/all_tasks_app_bar.dart';
import 'package:taskati_app/screens/login/widgets/custom_text_form_field.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AllTasksAppBar(appBarTitle: "profile"),
            SizedBox(height: 48.h,),
            Text("Name",style: TextStyles.font16Medium.copyWith(
              fontSize: 14.sp
            ),),
            SizedBox(height: 12.h,),
            CustomTextFormField(hintText: "Ahmed Mohammed"),
            SizedBox(height: 20.h,),
            Text("Email",style: TextStyles.font16Medium.copyWith(
                fontSize: 14.sp
            ),),
            SizedBox(height: 12.h,),
            CustomTextFormField(hintText: "Ahmed@gmail.com")
          ],
        ),
      ),
    );
  }
}
