import 'package:flutter/material.dart';
import 'package:taskati_app/screens/add_task/add_task_screen.dart';
import 'package:taskati_app/screens/home/home_screen.dart';
import 'package:taskati_app/screens/profile/profile_screen.dart';

import '../../core/utils/app_colors.dart';



class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex=0;
  List screens=[
    HomeScreen(),
    AddTaskScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 24,horizontal:16 ),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xffDDE2F3),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          _currentIndex==0?ActiveBottomNavBarIcon(title: "Home", icon:Icons.home):BottomNavBarIcon(icon: Icons.home,onTap: (){
            setState(() {

              _currentIndex=0;
            });
          },),
            _currentIndex==1?ActiveBottomNavBarIcon(title: "Add Task", icon:Icons.add):BottomNavBarIcon(icon: Icons.add,onTap: (){
              setState(() {
                _currentIndex=1;
              });
            },),
            _currentIndex==2?ActiveBottomNavBarIcon(title: "Profile", icon:Icons.person):BottomNavBarIcon(icon: Icons.person,onTap: (){
              setState(() {
                _currentIndex=2;
              });
            },),


          ],
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}


class ActiveBottomNavBarIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const ActiveBottomNavBarIcon({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 54,vertical: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.mainColor
      ),
      child: Row(
        children: [
          Icon(icon,color: Colors.white,),
          SizedBox(width: 5,),
          Text(title,style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),)
        ],
      ),
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const BottomNavBarIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.lightGrayColor ,
        child: Icon(icon,size: 30,),
      ),
    );
  }
}

