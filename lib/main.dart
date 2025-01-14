import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/taskati_app.dart';



void main()async{
  await ScreenUtil.ensureScreenSize();
  runApp(TaskatiApp());
}