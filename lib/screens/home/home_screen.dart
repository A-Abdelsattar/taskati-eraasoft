import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/styles.dart';
import 'package:taskati_app/core/widgets/task_item.dart';
import 'package:taskati_app/models/task_status_model.dart';
import 'package:taskati_app/screens/home/widgets/home_app_bar.dart';
import 'package:taskati_app/screens/home/widgets/home_task_status_container.dart';
import 'package:taskati_app/screens/home/widgets/row_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: ListView(
            children: [
            const HomeAppBar(),
            SizedBox(height: 24.h,),
            GridView.count(
              shrinkWrap: true,
              childAspectRatio:3,
              crossAxisSpacing: 17.w,
              mainAxisSpacing: 16.h
              ,crossAxisCount: 2,children:List.generate(tasksStatusList.length, (index) => HomeTaskStatusContainer(
                taskStatusModel:tasksStatusList[index] ,
              ),)),
              SizedBox(height: 24.h,),

              Divider(thickness: 1.h,color: Colors.black12,),
              SizedBox(height: 16.h,),
              const RowFilter(),
              SizedBox(height: 16.h,),

              ListView.separated(
                shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics()
              ,itemBuilder: (context,index)=>const TaskItem(), separatorBuilder: (context,index)=>SizedBox(height: 16.h,), itemCount: 10),

            ],
          ),
        ),
      ),
    );
  }
}
