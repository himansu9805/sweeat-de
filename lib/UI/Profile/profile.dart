import 'package:flutter/material.dart';
import "dart:math";
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  double deviceWidth = 0.0;
  double deviceHeight = 0.0;
  var _name, _email, _phone, _location;
  final _random = new Random();
  static const List<int> _avatarCircleColor = <int>[
    0xffff4164,
    0xfffa9b9b,
    0xfffacdaf,
    0xffcbccad,
    0xffc8c8aa
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      setState(() {
        _name = prefs.getString('name').toString();
        _email = prefs.getString('email').toString();
        _phone = prefs.getString('phone').toString();
        _location = prefs.getString('location').toString();
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
            "assets/images/login_page.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            width: deviceWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sweeat",
                  style: TextStyle(
                    fontFamily: 'LogoFont',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                Container(
                  width: 3 * deviceWidth / 4,
                  height: deviceHeight / 2,
                  child: _name == null
                      ? CircularProgressIndicator(
                          strokeWidth: 10.0,
                        )
                      : Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: deviceWidth / 8,
                                  backgroundColor: Color(_avatarCircleColor[
                                      _random
                                          .nextInt(_avatarCircleColor.length)]),
                                  child: Text(
                                    _name[0],
                                    style: TextStyle(
                                      fontFamily: "MainFont",
                                      color: Colors.white,
                                      fontSize: deviceWidth / 10,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  _name,
                                  style: TextStyle(
                                    fontFamily: "MainFont",
                                    fontWeight: FontWeight.bold,
                                    fontSize: deviceWidth / 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: deviceWidth * 0.5,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                                Icons.alternate_email_outlined),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              _email,
                                              style: TextStyle(
                                                fontFamily: "MainFont",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.phone_rounded),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              _phone,
                                              style: TextStyle(
                                                fontFamily: "MainFont",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on_rounded),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              _location != "null"
                                                  ? _location
                                                  : "Unknown",
                                              style: TextStyle(
                                                fontFamily: "MainFont",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                MaterialButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                    Route route =
                        MaterialPageRoute(builder: (context) => Login());
                    Navigator.pushReplacement(context, route);
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 180, 21, 21)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  focusElevation: 1,
                  hoverElevation: 1,
                  highlightElevation: 1,
                  color: Color.fromARGB(56, 165, 0, 0),
                  child: Text(
                    "LOGOUT",
                    style: TextStyle(
                      fontFamily: 'MainFont',
                      fontSize: deviceHeight * 0.018,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 180, 21, 21),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
