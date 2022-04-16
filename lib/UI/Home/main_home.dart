import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
  double deviceWidth = 0.0;
  double deviceHeight = 0.0;

  static const List<int> _avatarCircleColor = <int>[
    0xffff4164,
    0xfffa9b9b,
    0xfffacdaf,
    0xffcbccad,
    0xffc8c8aa
  ];

  final _random = new Random();
  final List<Map> dishList = <Map>[
    {
      "name": "Dish Item Name 001",
      "store": "Bhak and Sons",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.8"
    },
    {
      "name": "Dish Item Name 002",
      "store": "Bhak and Baps",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.6"
    },
    {
      "name": "Dish Item Name 003",
      "store": "Bhak and Patnis",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.2"
    },
    {
      "name": "Dish Item Name 004",
      "store": "Bhak and Sons",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.8"
    },
    {
      "name": "Dish Item Name 005",
      "store": "Bhak and Baps",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.6"
    },
    {
      "name": "Dish Item Name 006",
      "store": "Bhak and Patnis",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.2"
    },
    {
      "name": "Dish Item Name 007",
      "store": "Bhak and Sons",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.8"
    },
    {
      "name": "Dish Item Name 008",
      "store": "Bhak and Baps",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.6"
    },
    {
      "name": "Dish Item Name 009",
      "store": "Bhak and Patnis",
      "time": "999 hours",
      "price": "9999",
      "discount": "99",
      "rating": "4.2"
    }
  ];

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/landing_page.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sweeat",
                        style: TextStyle(
                            fontFamily: 'LogoFont',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Container(
                        width: deviceWidth * 0.6,
                        child: TextField(
                          cursorColor: Color(0xff3a3a3a),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xff3a3a3a),
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontFamily: 'MainFont',
                              color: Color(0xff3a3a3a),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color(_avatarCircleColor[
                            _random.nextInt(_avatarCircleColor.length)]),
                        child: const Text(
                          'AH',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: deviceHeight * 0.2,
                child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.right,
                    color: Color(0xfff6929b),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: deviceWidth * 0.75,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/dish6.jpg"),
                                  colorFilter: ColorFilter.mode(
                                      Colors.orange, BlendMode.multiply),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "SWEET OF THE MONTH",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: deviceHeight * 0.025,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Pista Barfi",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: deviceHeight * 0.0215,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Uttar Pradesh",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: deviceHeight * 0.015,
                                          fontFamily: 'MainFont',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: deviceWidth * 0.75,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/dish3.jpg"),
                                  colorFilter: ColorFilter.mode(
                                      Colors.lightGreen, BlendMode.multiply),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Aaj ki party meri taraf se!",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: deviceHeight * 0.025,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Use coupon JOIYECHE100 to get 100% off on all kind of products",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: deviceHeight * 0.02,
                                          fontFamily: 'MainFont',
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: Color(0xfff6929b),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        itemCount: dishList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      color: Colors.amberAccent,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dishList[index]["name"],
                                          style: TextStyle(
                                            fontSize: deviceHeight * 0.0225,
                                            fontFamily: 'MainFont',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          dishList[index]["store"],
                                          style: TextStyle(
                                            fontSize: deviceHeight * 0.02,
                                            fontFamily: 'MainFont',
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          "Delivers within " +
                                              dishList[index]["time"],
                                          style: TextStyle(
                                              fontSize: deviceHeight * 0.0175,
                                              fontFamily: 'MainFont',
                                              color: Colors.black54),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "₹" + dishList[index]["price"],
                                              style: TextStyle(
                                                fontSize: deviceHeight * 0.019,
                                                fontFamily: 'MainFont',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "-" +
                                                  dishList[index]["discount"] +
                                                  "% OFF",
                                              style: TextStyle(
                                                  fontSize:
                                                      deviceHeight * 0.019,
                                                  fontFamily: 'MainFont',
                                                  color: Colors.redAccent),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.green.shade700,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Icon(Icons.star_rounded,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              dishList[index]["rating"],
                                              style: TextStyle(
                                                  fontSize:
                                                      deviceHeight * 0.016,
                                                  fontFamily: 'MainFont',
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
