import 'package:caffe/constants.dart';
import 'package:caffe/model/cup_detailes.dart';
import 'package:caffe/widgets/cup_name.dart';
import 'package:caffe/widgets/custom_buttonCard.dart';
import 'package:caffe/widgets/location_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'location_screen.dart';

class CoffeeCupScreen extends StatefulWidget {
  static String id = 'CoffeeCupScreen';

  @override
  _CoffeeCupScreenState createState() => _CoffeeCupScreenState();
}

class _CoffeeCupScreenState extends State<CoffeeCupScreen> {
  int number = 1;
  final Color KCustomGreyColor = Colors.grey.shade300;
  int currentIndex = 0;
  List<Map<String, dynamic>> _detail = [
    {
      'vol': '120 ml',
      'price': '\$ 35'
    },
    {
      'vol': '250 ml',
      'price': '\$ 45'
    },
    {
      'vol': '400 ml',
      'price': '\$ 55'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CupDetailes _cupDetailes = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        backgroundColor: KMainColor,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: KWhiteColor),
        elevation: 0.0,
        title: Text(
          'Item Detail',
          style: TextStyle(color: KWhiteColor, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: width,
              ),
              cupName(_cupDetailes),
              SizedBox(height: 10,),
              Text(
                'BBC whipped cream',
                style: TextStyle(
                  color: KSecondColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 150,
                      margin: EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(_cupDetailes.imagePath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox(),),
                    Container(
                      child: Column(
                        children: <Widget>[
                          _customButton(Icons.add, increment, 0.0),
                          Text(
                            '$number',
                            style: TextStyle(
                              color: KWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          _customButton(Icons.minimize, decrement, 15.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => _customCupDetail(index, height),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 55.0,
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: KWhiteColor,
                ),
                child: customButtonCard(),
              ),
              locationButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customButton(IconData icon, Function onClick, double padding){
    return Container(
      height: 40.0,
      width: 40.0,
      margin: EdgeInsets.only(bottom: 10.0, top: 10),
      decoration: BoxDecoration(
        color: KMainColor,
        border: Border.all(color: KSecondColor, width: 2.0),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onClick,
        child: Padding(
          padding: EdgeInsets.only(bottom: padding),
          child: Icon(
            icon,
            color: KWhiteColor,
          ),
        ),
      ),
    );
  }
  Widget _customCupDetail(int index, height) {
    return GestureDetector(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 80.0,
        width: height>360.0 ? 80.0 : 100.0,
        margin: EdgeInsets.symmetric(horizontal: height>360.0 ? 20.0 : 60.0),
        decoration: BoxDecoration(
          color: index==currentIndex ? KThirdColor : KSecondColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              _detail[index]['vol'],
              style: TextStyle(color: KWhiteColor, fontSize: 16.0, fontWeight: FontWeight.bold),),
            Text(_detail[index]['price'], style: TextStyle(color: KWhiteColor, fontSize: 18.0, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
  void increment(){
    setState(() {
      number++ ;
    });
  }
  void decrement(){
    number > 1 ? setState(() {
      number-- ;
    }) : null ;
  }
}
