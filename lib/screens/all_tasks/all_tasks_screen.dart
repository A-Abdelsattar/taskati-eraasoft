


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/widgets/task_item.dart';
import 'package:taskati_app/screens/all_tasks/widgets/all_tasks_app_bar.dart';

class  AllTasksScreen extends StatelessWidget {
  final String appBarTitle;
  const AllTasksScreen ({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                SizedBox(height: 24.h,),
                AllTasksAppBar(appBarTitle: appBarTitle,),
                SizedBox(height: 24.h,),
                Expanded(child: ListView.separated(itemBuilder: (context,index)=>TaskItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 16.h,)
                  ,itemCount: 10,)),
              ],
            ),
          ),
      
      ),
    );
  }
}
