import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/models/task_status_model.dart';

import '../../screens/home/widgets/home_task_status_container.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';



class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrayColor),
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 5
                  ,child: Text("Flutter Practice",style: TextStyles.font16Medium,)),
              Expanded(flex:4,child: Text("Today",style: TextStyles.font12MediumGrey,))
            ],),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text("Todo Application",style: TextStyles.font12MediumGrey.copyWith(
                    fontWeight: FontWeight.w400
                ),),
              ),Expanded(
                flex: 4,
                child: Text("12:30 PM - 01:30 PM",style: TextStyles.font12MediumGrey.copyWith(
                    fontWeight: FontWeight.w400
                ),),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          const Divider(color: Colors.black12,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.newTaskColor,
                ),
                child: Text("New Task",style: TextStyles.font12MediumGrey.copyWith(
                    color: Colors.white
                ),),
              ),

              TextButton(onPressed: (){
                showDialog(context: context, builder:(context)=>AlertDialog(
                  title: Text("Change Task Status"),
                  titleTextStyle: TextStyles.font16Medium.copyWith(
                    color: Colors.black
                  ),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
                  backgroundColor: Colors.white,
                  content: Wrap(
                    children: [
                      ...List.generate(tasksStatusList.length, (index)=> Padding(
                        padding:  EdgeInsets.only(bottom: 12.0.h),
                        child: HomeTaskStatusContainer(
                          taskStatusModel:tasksStatusList[index] ,
                          onTap: (){
                            print("change status");
                          },
                        ),
                      ))
                    ],
                  ),
                ) );
              }, child: Text("Change Status",style: TextStyles.font12MediumGrey.copyWith(

                color: AppColors.newTaskColor,
                decoration:TextDecoration.underline,

              ),))
            ],
          )
        ],
      ),
    );
  }
}
