import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/styles.dart';


class AllTasksAppBar extends StatelessWidget {
  final String appBarTitle;

  const AllTasksAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColors.lightGrayColor,
            child:Center(child: Icon(Icons.arrow_back_ios_new,size: 16.r,)),
          ),
        ),
        SizedBox(width: 11.w,),
        Text(appBarTitle,style: TextStyles.font16Medium,)
      ],
    );
  }
}
