import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData {
  static getSweets() async {
    var data = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('stores').get();
    var documents = snapshot.docs;
    documents.forEach((element) {
      element["items"][0]["ref"].get().then((value) {
        data.add({
          "name: ": value["Name"],
          "store_name": element["name"],
          "price": element["items"][0]["price"].toString(),
          "discount": element["discount"].toString(),
          "rating": element["items"][0]["rating"].toString()
        });
      });
    });
    return data;
  }
}
