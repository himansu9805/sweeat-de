import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_sweeat/UI/Home/main_home.dart';

import '../Home/home.dart';

class Store extends StatefulWidget {
  Store({Key? key, required this.storeId, required this.sweetIndex})
      : super(key: key);

  final storeId, sweetIndex;

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  var deviceWidth = 0.0;
  var deviceHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Sweeat",
            style: TextStyle(
              fontFamily: 'LogoFont',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_rounded),
        backgroundColor: Color(0xffc897c6),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          width: deviceWidth,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('stores')
                      .doc(widget.storeId)
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasData) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      print(data);
                      return Container(
                        child: Column(
                          children: [
                            Text(
                              data["name"],
                              style: TextStyle(
                                fontSize: deviceHeight * 0.03,
                                fontFamily: 'MainFont',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              data["tagline"],
                              style: TextStyle(
                                fontSize: deviceHeight * 0.02,
                                fontFamily: 'MainFont',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              data["address"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: deviceHeight * 0.0175,
                                fontFamily: 'MainFont',
                                color: Color.fromARGB(255, 81, 81, 81),
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 60,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            color: Colors.greenAccent,
                                          ),
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star_rounded),
                                              Text(data["store_rating"]
                                                  .toString()),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                                255, 226, 226, 226),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "999",
                                                style: TextStyle(
                                                  fontSize:
                                                      deviceHeight * 0.015,
                                                  fontFamily: 'MainFont',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "reviews",
                                                style: TextStyle(
                                                  fontSize:
                                                      deviceHeight * 0.0125,
                                                  fontFamily: 'MainFont',
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.delivery_dining_rounded,
                                        color: data["delivery"]
                                            ? Colors.orangeAccent
                                            : Colors.grey,
                                        size: 50,
                                      ),
                                      Text(
                                        data["delivery"]
                                            ? "Delivery\neligible"
                                            : "Delivery\nnot eligible",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: deviceHeight * 0.015,
                                          fontFamily: 'MainFont',
                                          color: data["delivery"]
                                              ? Colors.black
                                              : Colors.redAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: deviceWidth,
                              child: Text(
                                "Menu",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: deviceHeight * 0.04,
                                  fontFamily: 'MainFont',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print(data["items"][index]["price"]);
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: widget.sweetIndex == index
                                            ? Colors.amberAccent[100]
                                            : Colors.transparent,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Column(
                                        children: [
                                          StreamBuilder<DocumentSnapshot>(
                                              stream: data["items"][index]
                                                      ["ref"]
                                                  .snapshots(),
                                              builder: (_, ss) {
                                                if (ss.hasError)
                                                  return Text(
                                                      'Error = ${ss.error}');

                                                if (ss.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                }

                                                if (ss.hasData) {
                                                  Map<String, dynamic> sweet =
                                                      ss.data!.data() as Map<
                                                          String, dynamic>;
                                                  return Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              sweet["Name"],
                                                              style: TextStyle(
                                                                fontSize:
                                                                    deviceHeight *
                                                                        0.0225,
                                                                fontFamily:
                                                                    'MainFont',
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: StreamBuilder<
                                                                  DocumentSnapshot>(
                                                                stream: sweet[
                                                                        "Region"]
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
                                                                        dynamic> region = ss
                                                                            .data!
                                                                            .data()
                                                                        as Map<
                                                                            String,
                                                                            dynamic>;
                                                                    return Text(
                                                                      "from " +
                                                                          region[
                                                                              "Name"] +
                                                                          " India",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            deviceHeight *
                                                                                0.0175,
                                                                        fontFamily:
                                                                            'MainFont',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    );
                                                                  }
                                                                  return CircularProgressIndicator();
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 7.5,
                                                            ),
                                                            Text(
                                                              "₹" +
                                                                  data["items"][
                                                                              index]
                                                                          [
                                                                          "price"]
                                                                      .toString() +
                                                                  "/kg",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    deviceHeight *
                                                                        0.0175,
                                                                fontFamily:
                                                                    'MainFont',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: Colors
                                                                            .yellow[
                                                                        800],
                                                                  ),
                                                                  Text(data["items"]
                                                                              [
                                                                              index]
                                                                          [
                                                                          "rating"]
                                                                      .toString()),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              child: Container(
                                                                height: 35,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.175,
                                                                child:
                                                                    MaterialButton(
                                                                  onPressed:
                                                                      () {},
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: Color(
                                                                            0xffc897c6)),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  elevation: 0,
                                                                  focusElevation:
                                                                      1,
                                                                  hoverElevation:
                                                                      1,
                                                                  highlightElevation:
                                                                      1,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          56,
                                                                          200,
                                                                          151,
                                                                          198),
                                                                  child: Text(
                                                                    "ADD",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'MainFont',
                                                                      fontSize:
                                                                          deviceHeight *
                                                                              0.018,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xffc897c6),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 125,
                                                          width: 125,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child:
                                                                Image.network(
                                                              sweet["imageURL"],
                                                              isAntiAlias: true,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return CircularProgressIndicator();
                                              }),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                        color: Colors.black,
                                        endIndent: 10.0,
                                        height: 20,
                                        thickness: 0.1,
                                      ),
                                  itemCount: data["items"].length),
                            ),
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
