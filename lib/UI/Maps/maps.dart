import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_sweeat/Services/fetch_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _Maps createState() => _Maps();
}

class _Maps extends State<Maps> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      for (var shop in shops) {
        final marker = Marker(
            markerId: MarkerId(shop["name"]),
            position: LatLng(shop["lat"], shop["lng"]),
            infoWindow: InfoWindow(
              title: shop["name"],
              snippet: shop["address"].toString().substring(0, 45) + "...",
            ));
        _markers[shop["name"]] = marker;
      }
    });
  }

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
  List shops = [];

  getShops() async {
    var data = await FetchData.getAllStores();
    //print(data);
    setState(() {
      shops = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getShops();
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      setState(() {
        _name = prefs.getString('name').toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    print(shops);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(22.270508166428375, 70.78550014652416),
              zoom: 14.0,
            ),
            markers: _markers.values.toSet(),
          ),
          Container(
            child: Stack(
              children: [
                Container(
                  height: deviceHeight * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/maps_header.png",
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sweeat",
                        style: TextStyle(
                          fontFamily: 'LogoFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: deviceWidth * 0.6,
                        child: TextField(
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
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
