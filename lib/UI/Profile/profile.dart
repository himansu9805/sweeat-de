import 'package:flutter/material.dart';
import "dart:math";
import 'package:shared_preferences/shared_preferences.dart';

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
      body: Center(
        child: Container(
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
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: deviceWidth / 8,
                          backgroundColor: Color(_avatarCircleColor[
                              _random.nextInt(_avatarCircleColor.length)]),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.alternate_email_outlined),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _location,
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
                ),
        ),
      ),
    );
  }
}
