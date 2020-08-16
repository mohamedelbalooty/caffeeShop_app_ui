import 'package:caffe/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customDeliverCard(height, width) {
  return Container(
    height: height > 360.0 ? height * 0.22 : height* 0.25,
    width: width * 0.9,
    margin: EdgeInsets.only(right: height*0.04, left: height*0.04),
    decoration: BoxDecoration(
        color: KCustomColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: KThirdColor, width: 1.5)),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Image(
            image: AssetImage('images/icons/delivery.png'),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Container(
            height: height > 360.0 ? height * 0.22 : height* 0.25,
            width: (width * 0.8) / 2,
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'From :'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Text(
                      'East Stroudsburg, PA',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: KBlackColor,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      'To :'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Text(
                      'Manchester Township',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: KBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
