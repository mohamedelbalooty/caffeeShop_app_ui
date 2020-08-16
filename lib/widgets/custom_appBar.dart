import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

Widget customAppBar(){
  return AppBar(
    titleSpacing: 0,
    elevation: 0.0,
    backgroundColor: KWhiteColor,
    title: Text(
      'Good morning Richared',
      style: TextStyle(
          color: KBlackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: KBlackColor,
        size: 28.0,
      ),
    ),
    actions: <Widget>[
      Container(
        height: 40.0,
        width: 40.0,
        margin: EdgeInsets.only(right: 10, top: 8.0, bottom: 8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('images/icons/placeholder.jpg'),
              fit: BoxFit.fill),
          shape: BoxShape.circle,),
      ),
    ],
  );
}