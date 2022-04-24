import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData {
  static getAllSweets() async {
    List<Map<String, dynamic>> data = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('sweets').get();
    var documents = snapshot.docs;
    documents.forEach((element) {
      data.add({"name": element["Name"]});
    });
    return data;
  }

  static getAllStores() async {
    List<Map<String, dynamic>> data = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('stores').get();
    var documents = snapshot.docs;
    documents.forEach((element) {
      data.add({
        "name": element.data()["name"],
        "address": element.data()["address"],
        "lat": element.data()["location"].latitude,
        "lng": element.data()["location"].longitude
      });
    });
    return data;
  }
}
