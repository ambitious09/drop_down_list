import 'package:flutter/material.dart';

class Utils{
  static Color getBackgroundColor(BuildContext context){
    print("1");
    return Theme.of(context).scaffoldBackgroundColor;
  }
}