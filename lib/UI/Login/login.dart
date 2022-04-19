import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_sweeat/UI/Home/home.dart';
import 'package:project_sweeat/UI/Signup/signup.dart';
import 'package:project_sweeat/Services/fire_auth.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double deviceWidth = 0.0;
  double deviceHeight = 0.0;

  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: deviceHeight,
            child: Stack(
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
                        "Login",
                        style: TextStyle(
                          fontFamily: 'MainFont',
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.075,
                          color: Color(0xff010101),
                        ),
                      ),
                      Container(
                        width: deviceWidth * 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 20.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 50.0),
                            child: Form(
                              key: _registerFormKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: deviceWidth * 0.7,
                                    child: TextFormField(
                                      controller: _emailTextController,
                                      focusNode: _focusEmail,
                                      cursorColor: Color(0xff3a3a3a),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.alternate_email_rounded,
                                          color: Color(0xff3a3a3a),
                                        ),
                                        hintText: "E-mail",
                                        hintStyle: TextStyle(
                                          fontFamily: 'MainFont',
                                          color: Color(0xff3a3a3a),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xffeaeaea),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: deviceWidth * 0.7,
                                    child: TextFormField(
                                      controller: _passwordTextController,
                                      focusNode: _focusPassword,
                                      obscureText: true,
                                      cursorColor: Color(0xff3a3a3a),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock_rounded,
                                          color: Color(0xff3a3a3a),
                                        ),
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          fontFamily: 'MainFont',
                                          color: Color(0xff3a3a3a),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xffeaeaea),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      fontFamily: 'MainFont',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff202020),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  _isProcessing
                                      ? CircularProgressIndicator()
                                      : Container(
                                          height: 45,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: MaterialButton(
                                            onPressed: () async {
                                              setState(() {
                                                _isProcessing = true;
                                              });

                                              if (_registerFormKey.currentState!
                                                  .validate()) {
                                                User? user = await FireAuth
                                                    .signInUsingEmailPassword(
                                                  email:
                                                      _emailTextController.text,
                                                  password:
                                                      _passwordTextController
                                                          .text,
                                                );

                                                setState(() {
                                                  _isProcessing = false;
                                                });

                                                if (user != null) {
                                                  Route route =
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Home());
                                                  Navigator.pushReplacement(
                                                      context, route);
                                                }
                                              }
                                              /*Route route = MaterialPageRoute(
                                            builder: (context) => Login());
                                        Navigator.pushReplacement(context, route);*/
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                            ),
                                            elevation: 0,
                                            focusElevation: 1,
                                            hoverElevation: 1,
                                            highlightElevation: 1,
                                            color: Color(0xffc897c6),
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                fontFamily: 'MainFont',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                  SizedBox(height: 20),
                                  Text(
                                    "or login with",
                                    style: TextStyle(
                                      fontFamily: 'MainFont',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff202020),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: deviceWidth * 0.5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Color(0xff808080),
                                              borderRadius:
                                                  BorderRadius.circular(999)),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                "assets/images/google_logo.png",
                                                height: 10,
                                                width: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.facebook_rounded,
                                          color: Color(0xff808080),
                                          size: 35,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Color(0xff808080),
                                              borderRadius:
                                                  BorderRadius.circular(999)),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                "assets/images/apple_logo.png",
                                                height: 10,
                                                width: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New with us? ",
                            style: TextStyle(
                              fontFamily: 'MainFont',
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => Signup());
                              Navigator.pushReplacement(context, route);
                            },
                            child: Text(
                              "Create account",
                              style: TextStyle(
                                fontFamily: 'MainFont',
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
