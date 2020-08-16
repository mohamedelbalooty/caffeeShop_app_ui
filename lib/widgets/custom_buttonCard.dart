import 'package:flutter/material.dart';
import '../constants.dart';

Widget customButtonCard(){
  return Center(
    child: InkWell(
      onTap: (){},
      child: Text(
        'Add to card',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: KCustomFontColor,
        ),
      ),
    ),
  );
}