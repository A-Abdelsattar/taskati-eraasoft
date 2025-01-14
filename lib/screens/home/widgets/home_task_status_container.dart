import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskati_app/models/task_status_model.dart';


class HomeTaskStatusContainer extends StatelessWidget {
 final TaskStatusModel taskStatusModel;
  const HomeTaskStatusContainer({super.key, required this.taskStatusModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: taskStatusModel.backgroundColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:taskStatusModel.backgroundIconColor
            ),
            child:SvgPicture.asset(taskStatusModel.svgIcon) ,
          ),
          SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskStatusModel.statusName,style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),),
              Text("${taskStatusModel.numberOfTasks} Task",style: TextStyle(
                  color: Colors.white70
              ),)
            ],
          )
        ],
      ),
    );
  }
}
