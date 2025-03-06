import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati_app/core/helpers/dio_helper.dart';
import 'package:taskati_app/core/helpers/shared_prefs_helper.dart';
import 'package:taskati_app/taskati_app.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefsHelper.init();
  DioHelper.init();
  print("-------------------------------");
  print(SharedPrefsHelper.getString("token"));
  await ScreenUtil.ensureScreenSize();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      child: TaskatiApp()));

}




