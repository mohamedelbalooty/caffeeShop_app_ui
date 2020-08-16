import 'package:flutter/material.dart';
import '../constants.dart';

Widget cupName(_cupDetailes){
  return Text(
    _cupDetailes.name,
    style: TextStyle(
      color: KWhiteColor,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
    ),
  );
}