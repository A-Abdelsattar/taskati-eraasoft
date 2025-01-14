import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/styles.dart';

import '../../../core/utils/app_colors.dart';




class RowFilter extends StatelessWidget {
  const RowFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Recent Tasks",style:TextStyles.font16Medium,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.lightGrayColor,)
          ),
          child: Row(
            children: [
              Icon(Icons.filter_alt_outlined,size: 16.sp,),
              SizedBox(width: 8.w,),
               Text("Filter",style: TextStyle(
                 fontSize: 14.sp
               ),),
              SizedBox(width: 16.w,),
             const Icon(Icons.keyboard_arrow_up),
            ],
          ),
        )
      ],
    );
  }
}
