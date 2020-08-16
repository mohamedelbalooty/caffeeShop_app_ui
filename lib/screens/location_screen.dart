import 'package:caffe/constants.dart';
import 'package:caffe/widgets/custom_deliverCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  static String id = 'LocationScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: height > 360.0 ? height * 0.50 : height * 0.55,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('images/navigate/navigation.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 60.0,
                          width: 60.0,
                          margin: EdgeInsets.only(
                              top: height * 0.09,
                              bottom: height * 0.03,
                              left: height * 0.07,
                              right: height * 0.07),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                ExactAssetImage('images/icons/placeholder.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    customDeliverCard(height, width),
                  ],
                ),
              ),
              Container(
                height: height > 360.0 ? height * 0.50 : height * 0.45,
                width: width,
                color: KCustomColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Jimmy Soekinj',
                        style: TextStyle(
                          color: KBlackColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Hi, I\'m on the way to deliver your order now. it will take about 20 minutes. thank you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                      _customCard(height, width),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: height*0.35,
            left: width*0.28,
            child: Container(
              height: 70.0,
              width: 70.0,
              margin: EdgeInsets.only(
                  top: height * 0.09,
                  bottom: height * 0.03,
                  left: height * 0.07,
                  right: height * 0.07),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 60.0,
                width: 60.0,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                    ExactAssetImage('images/icons/placeholder.jpg'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _customCard(height, width){
    return Container(
      height: height * 0.25,
      width: width,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: KCustomColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _customCardLocation(Container()),
          _customCardLocation(
            Container(
              height: 40.0,
              width: 80.0,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: KSecondColor,
              ),
              child: Center(child: Text('Check', style: TextStyle(color: KWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),)),
            ),
          ),
        ],
      ),
    );
  }
  Widget _customCardLocation(Widget widget){
    return Row(
      children: <Widget>[
        Container(
          height: 15.0,
          width: 15.0,
          margin: EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: KMainColor,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order Confirmed',
              style: TextStyle(
                color: KBlackColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              '05:00 AM [06 july 2020]',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox(),),
        widget,
      ],
    );
  }
}
