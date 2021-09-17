import 'package:flutter/material.dart';

class OnBordingFirst extends StatelessWidget {
  const OnBordingFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/home_page.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBordingSecond extends StatelessWidget {
  const OnBordingSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/welcome_page01.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "Explore the indigenous",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'MainFont',
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 25,
                                  color: Color(0xff010101),
                                ),
                              ),
                              Text(
                                "delicacies",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'MainFont',
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 25,
                                  color: Color(0xff010101),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Container(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: Text(
                            "forgotten taste you will never forget",
                            style: TextStyle(
                              fontFamily: 'MainFont',
                              fontSize: 15,
                              color: Color(0xff010101),
                            ),
                          ),
                        )
                      ],
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

class OnBordingThird extends StatelessWidget {
  const OnBordingThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/welcome_page02.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
