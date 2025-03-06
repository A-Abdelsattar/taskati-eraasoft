import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/styles.dart';

import '../all_tasks/widgets/all_tasks_app_bar.dart';
import '../login/presentation/widgets/custom_text_form_field.dart';


class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AllTasksAppBar(appBarTitle: "Create New Task"),
            SizedBox(height: 48.h,),
            Text("Task Name",style: TextStyles.font16Medium.copyWith(
                fontSize: 14.sp
            ),),
            SizedBox(height: 12.h,),
            CustomTextFormField(hintText: "Task name"),
            SizedBox(height: 20.h,),
            Text("Note",style: TextStyles.font16Medium.copyWith(
                fontSize: 14.sp
            ),),
            SizedBox(height: 12.h,),
            CustomTextFormField(hintText: "note"),
            SizedBox(height: 20.h,),

            Text("Date",style: TextStyles.font16Medium.copyWith(
                fontSize: 14.sp
            ),),
            SizedBox(height: 12.h,),

            CustomTextFormField(hintText: "Select Date",
            onTap: (){
              showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now());

            },
            ),


          ],
        ),
      ),
    );
  }
}
