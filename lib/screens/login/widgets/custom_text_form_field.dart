import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/app_colors.dart';


class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  const CustomTextFormField({super.key, required this.hintText, this.keyboardType, this.validator,this.isPassword=false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      keyboardType:widget.keyboardType ,
      obscureText: widget.isPassword&&isObscure,
      decoration:InputDecoration(
        suffixIcon: widget.isPassword?InkWell(
            onTap: (){
              setState(() {
                isObscure=!isObscure;
              });
            },
            child: Icon(Icons.visibility)):null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color:AppColors.grayColor
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(20.r),
          ),


      ) ,
    );
  }
}
