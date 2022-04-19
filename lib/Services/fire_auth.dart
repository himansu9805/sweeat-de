import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireAuth {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user?.updateDisplayName(name);
      user = userCredential.user;
      print(user!.uid + " " + phone);
      DocumentReference<Map<String, dynamic>> users =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      users.set({'phone': phone});
      final SharedPreferences prefs = await _prefs;
      prefs.setString('name', userCredential.user!.displayName.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    if (user != null) {}

    return user;
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      final SharedPreferences prefs = await _prefs;
      var document =
          FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      prefs.setString('uid', user.uid.toString());
      prefs.setString('name', user.displayName.toString());
      prefs.setString('email', user.email.toString());
      document.then((value) {
        prefs.setString('phone', value["phone"].toString());
        prefs.setString('location', value["location"].toString());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
