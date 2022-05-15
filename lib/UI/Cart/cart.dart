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

  List<Map<String, dynamic>> staticData = [
    {
      "name": "Thekua",
      "price": 60,
      "count": 2,
      "store": "Sharma Sweet Mart",
      "imageURL":
          "https://firebasestorage.googleapis.com/v0/b/de-sweeats.appspot.com/o/thekua.jpg?alt=media&token=d710c90d-7784-4758-9089-a7f40baff7e8",
    },
    {
      "name": "Rasgulla",
      "price": 120,
      "count": 3,
      "store": "Upadhaya and Sons",
      "imageURL":
          "https://firebasestorage.googleapis.com/v0/b/de-sweeats.appspot.com/o/rasgulla.jpg?alt=media&token=22779d5f-60f8-4c72-9027-6e39cc2e1098",
    },
    {
      "name": "Pantua",
      "price": 69,
      "count": 2,
      "store": "Ghanshyam Sweets",
      "imageURL":
          "https://firebasestorage.googleapis.com/v0/b/de-sweeats.appspot.com/o/pantua.jpg?alt=media&token=6eb31a20-d482-4b74-aabd-81f34179c2eb",
    },
    {
      "name": "Rajbhog",
      "price": 87,
      "count": 1,
      "store": "Ghanshyam Sweets",
      "imageURL":
          "https://firebasestorage.googleapis.com/v0/b/de-sweeats.appspot.com/o/bolinhas.jpg?alt=media&token=18795622-1348-484f-a468-f71c47d5dcd6",
    }
  ];

  final _random = new Random();
  num total = 0;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      setState(() {
        _name = prefs.getString('name').toString();
      });
    });
  }

  setTotal() {
    total = 0;
    staticData.forEach((element) {
      total += element["price"] * element["count"];
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/cartBg.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                  Container(
                    width: deviceWidth,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "MY CART",
                          style: TextStyle(
                            fontFamily: 'MainFont',
                            color: Color(0xff3a3a3a),
                            fontSize: deviceWidth * 0.075,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                      color: Colors.black,
                                      height: 20,
                                      thickness: 0.1,
                                    ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: staticData.length,
                                itemBuilder: (BuildContext context, index) {
                                  total = 0;
                                  setTotal();
                                  return Container(
                                    key: Key(index.toString()),
                                    width: deviceWidth,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                staticData[index]["imageURL"],
                                                isAntiAlias: true,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            width: deviceWidth * 0.25,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        staticData[index]
                                                            ["name"],
                                                        style: TextStyle(
                                                          fontSize:
                                                              deviceHeight *
                                                                  0.02,
                                                          fontFamily:
                                                              'MainFont',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        staticData[index]
                                                            ["store"],
                                                        style: TextStyle(
                                                          fontSize:
                                                              deviceHeight *
                                                                  0.0175,
                                                          fontFamily:
                                                              'MainFont',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        "₹" +
                                                            staticData[index]
                                                                    ["price"]
                                                                .toString() +
                                                            "/kg",
                                                        style: TextStyle(
                                                          fontSize:
                                                              deviceHeight *
                                                                  0.019,
                                                          fontFamily:
                                                              'MainFont',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  "₹" +
                                                      (staticData[index]
                                                                  ["price"] *
                                                              staticData[index]
                                                                  ["count"])
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize:
                                                        deviceHeight * 0.025,
                                                    fontFamily: 'MainFont',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.redAccent,
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    staticData.removeAt(index);
                                                    setTotal();
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                staticData[index]["count"] != 0
                                                    ? new IconButton(
                                                        icon: new Icon(
                                                            Icons.remove),
                                                        onPressed: () {
                                                          setState(() {
                                                            staticData[index]
                                                                ["count"]--;
                                                            setTotal();
                                                          });
                                                        })
                                                    : new Container(),
                                                new Text(
                                                  staticData[index]["count"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize:
                                                        deviceHeight * 0.02,
                                                    fontFamily: 'MainFont',
                                                  ),
                                                ),
                                                new IconButton(
                                                    icon: new Icon(Icons.add),
                                                    onPressed: () {
                                                      setState(() {
                                                        staticData[index]
                                                            ["count"]++;
                                                        setTotal();
                                                      });
                                                    })
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: deviceWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    margin: EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total: " + "₹" + total.toString(),
                          style: TextStyle(
                            fontSize: deviceHeight * 0.0225,
                            fontFamily: 'MainFont',
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 50, 180, 21)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          focusElevation: 1,
                          hoverElevation: 1,
                          highlightElevation: 1,
                          color: Color.fromARGB(56, 36, 165, 0),
                          child: Text(
                            "ORDER",
                            style: TextStyle(
                              fontFamily: 'MainFont',
                              fontSize: deviceHeight * 0.018,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 50, 180, 21),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
