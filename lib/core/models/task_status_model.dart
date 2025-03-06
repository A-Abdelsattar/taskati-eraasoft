import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


class TaskStatusModel{
  String  statusName;
  int numberOfTasks;
  String svgIcon;
  Color backgroundColor;
  Color backgroundIconColor;

  TaskStatusModel(
      {
        required this.statusName,
        required this.numberOfTasks,
        required this.svgIcon,
        required this.backgroundColor,
        required this.backgroundIconColor});
}

List<TaskStatusModel> tasksStatusList=[
  TaskStatusModel(statusName: "New Tasks", numberOfTasks: 12, svgIcon: "assets/icons/new_task_icon.svg", backgroundColor: AppColors.newTaskColor, backgroundIconColor: AppColors.newTaskLightColor),
  TaskStatusModel(statusName: "InProgress Tasks", numberOfTasks: 12, svgIcon: "assets/icons/new_task_icon.svg", backgroundColor: AppColors.inProgressColor, backgroundIconColor: AppColors.inProgressLightColor),
  TaskStatusModel(statusName: "Completed Tasks", numberOfTasks: 12, svgIcon: "assets/icons/new_task_icon.svg", backgroundColor: AppColors.completeColor, backgroundIconColor: AppColors.completeLightColor),
  TaskStatusModel(statusName: "Out Dated Tasks", numberOfTasks: 12, svgIcon: "assets/icons/new_task_icon.svg", backgroundColor: AppColors.outDatedColor, backgroundIconColor: AppColors.outDatedLightColor),

];