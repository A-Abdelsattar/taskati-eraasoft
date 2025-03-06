import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/helpers/shared_prefs_helper.dart';

import 'features/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'features/login/logic/login_cubit.dart';
import 'features/login/presentation/login_screen.dart';


class TaskatiApp extends StatelessWidget {
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home:SharedPrefsHelper.getString("token")==null? BlocProvider(
          create: (context) => LoginCubit(),
          child: LoginScreen(),
        ):BottomNavBarScreen(),

      ),
    );
  }
}
