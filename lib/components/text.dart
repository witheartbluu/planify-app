import 'dart:ui';
import 'package:flutter/material.dart';

class AppText {
static TextStyle boldTextFeildStyle(){
    return const TextStyle(
          color: Colors.black, 
          fontFamily: 'Poppins', 
          fontWeight: FontWeight.bold, 
          fontSize: 30.0
    );
  }

  static TextStyle mediumTextFeildStyle(){
    return const TextStyle(
          color: Colors.black, 
          fontFamily: 'Poppins', 
          fontWeight: FontWeight.w600, 
          fontSize: 24.0
    );
  }

    static TextStyle smallTextFeildStyle(){
    return const TextStyle(
          color: Color.fromARGB(255, 153, 0, 255), 
          fontFamily: 'Poppins', 
          fontWeight: FontWeight.w300, 
          fontSize: 10.0
    );
  }
}