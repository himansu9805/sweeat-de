import 'package:flutter/material.dart';
import "dart:math";

import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart> {
  double deviceWidth = 0.0;
  double deviceHeight = 0.0;
  var _name;
  static const List<int> _avatarCircleColor = <int>[
    0xffff4164,
    0xfffa9b9b,
    0xfffacdaf,
    0xffcbccad,
    0xffc8c8aa
  ];

  final _random = new Random();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      setState(() {
        _name = prefs.getString('name').toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/cartBg.png",
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
                      SizedBox(
                        width: deviceWidth * 0.6,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(_avatarCircleColor[
                            _random.nextInt(_avatarCircleColor.length)]),
                        child: _name == null
                            ? CircularProgressIndicator()
                            : Text(
                                _name[0],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                      ),
                    ],
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
