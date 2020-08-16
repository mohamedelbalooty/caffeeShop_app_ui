import 'package:caffe/screens/location_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

Widget locationButton(context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 13.0, ),
        child: Text(
          'Swipe-up for additional detail',
          style: TextStyle(color: KSecondColor, fontSize: 16.0, letterSpacing: 1.0),),
      ),
      IconButton(
        onPressed: (){
          Navigator.pushNamed(context, LocationScreen.id);
        },
        icon: Icon(
          Icons.keyboard_arrow_up,
          size: 40.0,
          color: KSecondColor,
        ),
      ),
    ],
  );
}