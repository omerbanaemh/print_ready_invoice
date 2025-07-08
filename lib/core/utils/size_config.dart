import 'package:flutter/material.dart';

class SizeConfig {
  static const double desktop = 550;
  // static const double tablet = 800;

  static  double  width(BuildContext context){
    return MediaQuery.sizeOf(context).width;
  }
  //  height;
    static  double  height(BuildContext context){
    return MediaQuery.sizeOf(context).height;
  }

  // static init(BuildContext context) {
  //   height = MediaQuery.sizeOf(context).height;
  //   width = MediaQuery.sizeOf(context).width;
  //   print('width =  $width');
  // }
}
