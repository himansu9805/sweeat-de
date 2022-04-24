import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "dart:math";

import 'package:project_sweeat/Services/fetch_data.dart';
import 'package:project_sweeat/UI/Store/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
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
  final FirebaseFirestore fb = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _allSweets = [];
  List<Map<String, dynamic>> _foundSweets = [];

  final _nameTextController = TextEditingController();
  final _focusName = FocusNode();
  sweetsFutureToList() async {
    _allSweets = await FetchData.getAllSweets();
  }

  @override
  void initState() {
    super.initState();
    _foundSweets = [
      {"name": "none"}
    ];
    sweetsFutureToList();
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      setState(() {
        _name = prefs.getString('name').toString();
      });
    });
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = [
        {"name": "none"}
      ];
    } else {
      results = _allSweets
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundSweets = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/landing_page.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            SingleChildScrollView(
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
                          Container(
                            width: deviceWidth * 0.6,
                            child: TextField(
                              controller: _nameTextController,
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
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onChanged: (value) => _runFilter(value),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Color(
                              _avatarCircleColor[
                                  _random.nextInt(_avatarCircleColor.length)],
                            ),
                            child: _name == null
                                ? CircularProgressIndicator()
                                : Text(
                                    _name[0],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: deviceHeight * 0.2,
                            child: ScrollConfiguration(
                              behavior: ScrollBehavior(),
                              child: GlowingOverscrollIndicator(
                                axisDirection: AxisDirection.right,
                                color: Color(0xfff6929b),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Container(
                                      width: deviceWidth * 0.75,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 8.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        elevation: 5.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/dish6.jpg"),
                                              colorFilter: ColorFilter.mode(
                                                  Colors.orange,
                                                  BlendMode.multiply),
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "SWEET OF THE MONTH",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize:
                                                          deviceHeight * 0.025,
                                                      fontFamily: 'MainFont',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontSize:
                                                          deviceHeight * 0.0215,
                                                      fontFamily: 'MainFont',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontSize:
                                                          deviceHeight * 0.015,
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        elevation: 5.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/dish3.jpg"),
                                              colorFilter: ColorFilter.mode(
                                                  Colors.lightGreen,
                                                  BlendMode.multiply),
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(15),
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Aaj ki party meri taraf se!",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize:
                                                          deviceHeight * 0.025,
                                                      fontFamily: 'MainFont',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontSize:
                                                          deviceHeight * 0.0175,
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
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: deviceHeight * 0.545,
                            width: deviceWidth,
                            child: Expanded(
                              child: ScrollConfiguration(
                                behavior: ScrollBehavior(),
                                child: GlowingOverscrollIndicator(
                                  axisDirection: AxisDirection.down,
                                  color: Color(0xfff6929b),
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('stores')
                                        .snapshots(),
                                    builder: (_, snapshot) {
                                      if (snapshot.hasError)
                                        return Text(
                                            'Error = ${snapshot.error}');

                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(child: Text("Loading"));
                                      }

                                      if (snapshot.hasData) {
                                        return ListView(
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.all(20),
                                          children: snapshot.data!.docs
                                              .map((DocumentSnapshot document) {
                                            Map<String, dynamic> data =
                                                document.data()!
                                                    as Map<String, dynamic>;
                                            if (data['items'].length == 0) {
                                              return SizedBox();
                                            }
                                            var index = Random()
                                                .nextInt(data['items'].length);
                                            DocumentReference refer =
                                                data['items'][index]['ref'];

                                            return GestureDetector(
                                              onTap: (() {
                                                Route route = MaterialPageRoute(
                                                    builder: (context) => Store(
                                                          storeId: document.id,
                                                          sweetIndex: index,
                                                        ));
                                                Navigator.push(context, route);
                                              }),
                                              child: Container(
                                                width: deviceWidth,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: StreamBuilder<
                                                                  DocumentSnapshot>(
                                                              stream: refer
                                                                  .snapshots(),
                                                              builder: (_, ss) {
                                                                if (ss.hasError)
                                                                  return Text(
                                                                      'Error = ${snapshot.error}');

                                                                if (ss.connectionState ==
                                                                    ConnectionState
                                                                        .waiting) {
                                                                  return CircularProgressIndicator();
                                                                }

                                                                if (ss
                                                                    .hasData) {
                                                                  var obj = ss
                                                                          .data
                                                                          ?.data()!
                                                                      as Map<
                                                                          String,
                                                                          dynamic>;

                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    child: Image
                                                                        .network(
                                                                      obj["imageURL"],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                }
                                                                return CircularProgressIndicator();
                                                              }),
                                                        ),
                                                        SizedBox(
                                                          width: deviceHeight *
                                                              0.02,
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              StreamBuilder<
                                                                      DocumentSnapshot>(
                                                                  stream: refer
                                                                      .snapshots(),
                                                                  builder:
                                                                      (_, ss) {
                                                                    if (ss
                                                                        .hasError)
                                                                      return Text(
                                                                          'Error = ${snapshot.error}');

                                                                    if (ss.connectionState ==
                                                                        ConnectionState
                                                                            .waiting) {
                                                                      return Text(
                                                                        "Loading",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              deviceHeight * 0.0225,
                                                                          fontFamily:
                                                                              'MainFont',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      );
                                                                    }

                                                                    if (ss
                                                                        .hasData) {
                                                                      var obj = ss
                                                                              .data
                                                                              ?.data()!
                                                                          as Map<
                                                                              String,
                                                                              dynamic>;

                                                                      return Text(
                                                                        obj["Name"],
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              deviceHeight * 0.02,
                                                                          fontFamily:
                                                                              'MainFont',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      );
                                                                    }
                                                                    return Text(
                                                                      "Loading",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            deviceHeight *
                                                                                0.0225,
                                                                        fontFamily:
                                                                            'MainFont',
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    );
                                                                  }),
                                                              Container(
                                                                child: StreamBuilder<
                                                                    DocumentSnapshot>(
                                                                  stream: refer
                                                                      .snapshots(),
                                                                  builder:
                                                                      (_, ss) {
                                                                    if (ss
                                                                        .hasError)
                                                                      return Text(
                                                                          'Error = ${ss.error}');

                                                                    if (ss.connectionState ==
                                                                        ConnectionState
                                                                            .waiting) {
                                                                      return CircularProgressIndicator();
                                                                    }

                                                                    if (ss
                                                                        .hasData) {
                                                                      Map<String,
                                                                          dynamic> sweet = ss
                                                                              .data!
                                                                              .data()
                                                                          as Map<
                                                                              String,
                                                                              dynamic>;
                                                                      return StreamBuilder<
                                                                              DocumentSnapshot>(
                                                                          stream: sweet["Region"]
                                                                              .snapshots(),
                                                                          builder:
                                                                              (_, ss) {
                                                                            if (ss.hasError)
                                                                              return Text('Error = ${ss.error}');

                                                                            if (ss.connectionState ==
                                                                                ConnectionState.waiting) {
                                                                              return CircularProgressIndicator();
                                                                            }

                                                                            if (ss.hasData) {
                                                                              Map<String, dynamic> region = ss.data!.data() as Map<String, dynamic>;
                                                                              return Text(
                                                                                "from " + region["Name"] + " India",
                                                                                style: TextStyle(
                                                                                  fontSize: deviceHeight * 0.0175,
                                                                                  fontFamily: 'MainFont',
                                                                                  color: Colors.black,
                                                                                ),
                                                                              );
                                                                            }
                                                                            return CircularProgressIndicator();
                                                                          });
                                                                    }
                                                                    return CircularProgressIndicator();
                                                                  },
                                                                ),
                                                              ),
                                                              Container(
                                                                width:
                                                                    deviceWidth *
                                                                        0.4,
                                                                child: Text(
                                                                  data["name"],
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        deviceHeight *
                                                                            0.0175,
                                                                    fontFamily:
                                                                        'MainFont',
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    "₹" +
                                                                        data["items"][index]["price"]
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          deviceHeight *
                                                                              0.019,
                                                                      fontFamily:
                                                                          'MainFont',
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    "-" +
                                                                        data["discount"]
                                                                            .toString() +
                                                                        "% OFF",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            deviceHeight *
                                                                                0.019,
                                                                        fontFamily:
                                                                            'MainFont',
                                                                        color: Colors
                                                                            .redAccent),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: data["items"]
                                                                        [index]
                                                                    ["rating"] >
                                                                3.5
                                                            ? Colors
                                                                .green.shade700
                                                            : data["items"][index]
                                                                        [
                                                                        "rating"] >
                                                                    2
                                                                ? Colors.yellow
                                                                    .shade700
                                                                : Colors.red
                                                                    .shade700,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            5,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            child: Icon(
                                                                Icons
                                                                    .star_rounded,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                            data["items"][index]
                                                                    ["rating"]
                                                                .toStringAsFixed(
                                                                    1),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    deviceHeight *
                                                                        0.016,
                                                                fontFamily:
                                                                    'MainFont',
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        );
                                      }
                                      return CircularProgressIndicator();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: _foundSweets.isNotEmpty
                            ? _foundSweets[0]["name"] == "none"
                                ? SizedBox()
                                : SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: min(
                                            deviceHeight * 0.75,
                                            75 *
                                                _foundSweets.length.toDouble()),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: _foundSweets.length,
                                          itemBuilder: (context, index) =>
                                              Container(
                                            key: ValueKey(
                                                _foundSweets[index]["name"]),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            padding: EdgeInsets.all(20.0),
                                            child: Text(
                                                _foundSweets[index]['name']),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: deviceWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'No results found',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
