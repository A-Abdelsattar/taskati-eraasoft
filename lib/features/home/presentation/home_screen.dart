import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/extentions.dart';
import 'package:taskati_app/core/widgets/task_item.dart';
import 'package:taskati_app/features/home/logic/home_cubit.dart';

import '../../../core/models/task_status_model.dart';
import '../../all_tasks/all_tasks_screen.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_task_status_container.dart';
import 'widgets/row_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: ListView(
            children: [
              const HomeAppBar(),
              SizedBox(
                height: 24.h,
              ),
              GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 3,
                  crossAxisSpacing: 17.w,
                  mainAxisSpacing: 16.h,
                  crossAxisCount: 2,
                  children: List.generate(
                    tasksStatusList.length,
                    (index) => HomeTaskStatusContainer(
                      taskStatusModel: tasksStatusList[index],
                      onTap: () {
                        context.push(AllTasksScreen(
                          appBarTitle: tasksStatusList[index].statusName,
                        ));
                      },
                    ),
                  )),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                thickness: 1.h,
                color: Colors.black12,
              ),
              SizedBox(
                height: 16.h,
              ),
              const RowFilter(),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(state is GetTasksLoadingState){
                    return Center(child: CircularProgressIndicator());
                  }else if(state is GetTasksSuccessState){
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>  TaskItem(
                          task: state.tasks[index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16.h,
                        ),
                        itemCount: state.tasks.length);
                  }else{
                    return Text("Error");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
