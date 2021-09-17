import 'package:flutter/material.dart';
import 'onboarding_widgets.dart';

class Onbording extends StatefulWidget {
  Onbording({Key? key}) : super(key: key);

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  double screenWidth = 0.0;
  double screenheight = 0.0;

  int currentPageValue = 0;
  int previousPageValue = 0;
  PageController controller = new PageController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    controller = PageController(initialPage: currentPageValue);
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    final List<Widget> introWidgetsList = <Widget>[
      OnBordingFirst(),
      OnBordingSecond(),
      OnBordingThird(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: introWidgetsList.length,
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
                controller: controller,
                itemBuilder: (context, index) {
                  return introWidgetsList[index];
                },
              ),
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: screenheight / 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < introWidgetsList.length; i++)
                          if (i == currentPageValue)
                            circleBar(true)
                          else
                            circleBar(false),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: currentPageValue == 0 ? true : false,
                child: Container(
                  margin: EdgeInsets.only(bottom: screenheight / 10),
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
              ),
              Visibility(
                visible: currentPageValue == introWidgetsList.length - 1
                    ? true
                    : false,
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    margin: EdgeInsets.only(right: 25, bottom: 25),
                    child: FloatingActionButton(
                      onPressed: () {
                        /* Route route =
                          MaterialPageRoute(builder: (context) => Login());
                      Navigator.pushReplacement(context, route);*/
                      },
                      backgroundColor: Color(0xffDA70D9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(999))),
                      child: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
