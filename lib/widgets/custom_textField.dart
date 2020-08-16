import 'package:flutter/material.dart';

import '../constants.dart';

Widget customTextField(KCustomGreyColor){
  return Padding(
    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
    child: TextField(
      cursorColor: KBlackColor,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        filled: true,
        fillColor: KCustomGreyColor,
        hintText: 'Search for coffee cup',
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 17,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: KCustomColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
          borderSide: BorderSide(color: KCustomColor),
        ),
        prefixIcon: Container(
          height: 40.0,
          width: 40.0,
          margin: EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            Icons.search,
            color: KBlackColor,
          ),
          decoration: BoxDecoration(
            color: KWhiteColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ),
  );
}