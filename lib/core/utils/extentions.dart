

import 'package:flutter/material.dart';

extension Navigation on BuildContext{
  pushAndRemoveUntil(Widget newScreen){
    Navigator.pushAndRemoveUntil(this,
      MaterialPageRoute(builder: (context) => newScreen), (
          route) => false,);
  }

  push(Widget newScreen){
    Navigator.push(this, MaterialPageRoute(builder: (context) => newScreen));
  }
}