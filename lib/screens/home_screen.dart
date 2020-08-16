import 'package:caffe/model/cup_detailes.dart';
import 'package:caffe/widgets/custom_appBar.dart';
import 'package:caffe/widgets/custom_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'coffee_cup_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Color KCustomGreyColor = Colors.grey.shade300;
  int _currentIndex = 0;
  int _bottomNavigationBarIndex = 0;
  List<Map<String, dynamic>> _dataList = [
    {
      'title': 'Coffee',
      'imagePath': 'images/icons/coffee.png',
    },
    {
      'title': 'Cake',
      'imagePath': 'images/icons/cake.png',
    },
    {
      'title': 'Snacks',
      'imagePath': 'images/icons/french.png',
    },
    {
      'title': 'Ice',
      'imagePath': 'images/icons/ice.png',
    },
    {
      'title': 'Pizza',
      'imagePath': 'images/icons/pizza.png',
    }
  ];
  List<CupDetailes> _cupDetailesList = [
    CupDetailes(
      name: 'Piccolo Latte',
      price: '\$ 40',
      imagePath: 'images/cups/cup1.png',
      ratting: '⭐',
    ),
    CupDetailes(
      name: 'Macchiato',
      price: '\$ 45',
      imagePath: 'images/cups/cup2.png',
      ratting: '⭐⭐',
    ),
    CupDetailes(
      name: 'Cappuccino',
      price: '\$ 40',
      imagePath: 'images/cups/cup3.png',
      ratting: '⭐⭐⭐',
    ),
    CupDetailes(
      name: 'Mocha',
      price: '\$ 50',
      imagePath: 'images/cups/cup4.png',
      ratting: '⭐⭐⭐⭐',
    ),
    CupDetailes(
      name: 'Espresso',
      price: '\$ 35',
      imagePath: 'images/cups/cup5.png',
      ratting: '⭐⭐⭐⭐⭐',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KWhiteColor,
      appBar: customAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              customTextField(KCustomGreyColor),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 60.0,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: _customItem(index),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Available Promo',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: KBlackColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 24.0,
                      color: KCustomFontColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              _promoCard(),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: width,
                    ),
                    Text(
                      'Your Recommendation',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: KBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 110.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _cupDetailesList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CoffeeCupScreen.id, arguments: _cupDetailesList[index]);
                        },
                        child: _customCupDetailes(index),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationBarIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: KWhiteColor,
        elevation: 10.0,
        iconSize: 30.0,
        fixedColor: KSecondColor,
        onTap: (int index){
          setState(() {
            _bottomNavigationBarIndex = index;
          });
        },
        items: [
          _customBottomItem(Icons.home, _bottomNavigationBarIndex, 0),
          _customBottomItem(Icons.shopping_cart, _bottomNavigationBarIndex, 1),
          _customBottomItem(Icons.call_to_action, _bottomNavigationBarIndex, 2),
        ],
      ),
    );
  }


  Widget _customItem(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 60.0,
        width: 125.0,
        decoration: BoxDecoration(
          color: index == _currentIndex ? KSecondColor : KCustomGreyColor,
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 45.0,
              width: 45.0,
              margin: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                color: KWhiteColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage(
                    _dataList[index]['imagePath'],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                _dataList[index]['title'],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _promoCard() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: KCustomColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: KCustomGreyColor, width: 2.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Coffee Yard Time:',
                    style: _customStyle(16.0),
                  ),
                  Text(
                    '9:00 am - 5:30 pm',
                    style: _customStyle(18.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45.0,
                    width: MediaQuery.of(context).size.width / 2,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: KMainColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        '50% Discount',
                        style: TextStyle(color: KWhiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: ExactAssetImage('images/coffee/coffee.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  _customStyle(double fontSize) {
    return TextStyle(
      color: KMainColor,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }
  Widget _customCupDetailes(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 110.0,
        width: 105.0,
        decoration: BoxDecoration(
          color: KWhiteColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: KCustomGreyColor, width: 2.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Image(
                  image: AssetImage(_cupDetailesList[index].imagePath),
                  height: 60.0,
                  width: 105,
                ),
              ),
              Text(
                _cupDetailesList[index].name,
                style: TextStyle(
                  color: KBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_cupDetailesList[index].price, style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    _cupDetailesList[index].ratting,
                    style: TextStyle(fontSize: 9.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  _customBottomItem(IconData icon, _bottomNavigationBarIndex, index){
    return BottomNavigationBarItem(
      icon: Icon(icon, color: _bottomNavigationBarIndex == index ? KSecondColor : KForthColor,),
      title: Container(),
    );
  }
}