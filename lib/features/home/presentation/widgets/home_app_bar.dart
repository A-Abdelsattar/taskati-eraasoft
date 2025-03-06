import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskati_app/core/utils/styles.dart';

import '../../../../core/utils/app_colors.dart';



class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello 👌",style: TextStyle(
                  color: AppColors.grayColor
              ),),
              Text("Ahmed Mohammed ",style: TextStyles.font16Medium,maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),

        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.lightGrayColor,
          child: SvgPicture.asset("assets/icons/notification.svg"),
        )

      ],
    );
  }
}
