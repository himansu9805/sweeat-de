import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData {
  static getMarker() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('stores').get();
    var documents = snapshot.docs;
    documents.forEach((element) {
      element["items"][0]["ref"]
          .get()
          .then((value) => print("Name: " + value["Name"]));
      print("Store Name: " + element["name"]);
      print("Delivers within 999 hours");
      print("Price: " + element["items"][0]["price"].toString());
      print("Discount: " + element["discount"].toString());
      print("Rating: " + element["items"][0]["rating"].toString());
    });
  }
}
