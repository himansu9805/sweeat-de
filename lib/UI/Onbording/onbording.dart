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
