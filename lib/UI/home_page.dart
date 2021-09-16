import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset("assets/images/home_page.jpg"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Sweeat",
                            style: TextStyle(
                              fontFamily: 'LogoFont',
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height / 10,
                              color: Color(0xff010101),
                            ),
                          ),
                        ),
                        Text(
                          "forgotten taste you will never forget",
                          style: TextStyle(
                            fontFamily: 'MainFont',
                            fontSize: 15,
                            color: Color(0xff010101),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      elevation: 0,
                      color: Color(0xffb1eeef),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontFamily: 'MainFont',
                          fontSize: 20,
                          color: Color(0xff010101),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
