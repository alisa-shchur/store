import 'package:flutter/material.dart';

Widget myTextField(String hintText,keyBoardType,controller){
  return TextField(
    style: TextStyle(color: Colors.black),
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
  );
}