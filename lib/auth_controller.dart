import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:menstrual_period_tracker/loginsignup/loginsignup.dart';
import 'package:menstrual_period_tracker/service/database.dart';
import 'package:menstrual_period_tracker/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  // you authcontroller chai jata bata ne access huna prayo
  // kina ki getxcontroller chai state management ko lagi ho ani
  //user ko input ko condition ansuar chai yo page navigae huna paryo
  static AuthController instance =
      Get.find(); //instace banako kina vane jata bata ne access garna parxa
  // get.find() chai special method ho instance create garne

  //to access this instance from any page
  late Rx<User?> _user; // yo chai firebase le pahtaune ho
  // user file or object ho jasma email password haru hunxa
  //late use gareko chai initialize nagarne vayera ho paile vako object use garne ho jun firebase le pathauxa

  FirebaseAuth auth = FirebaseAuth.instance;
  //The FirebaseAuth.instance property is a singleton object that represents the current authentication state of the application. It can be used to perform various authentication-related tasks such as creating and managing user accounts, signing in and out of the app, and sending and validating email and password reset requests.
  @override
  // multiple method vayo vane override garinxa
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth
        .currentUser); // auth le deko currentuser chai user ma assign gareko
    //our user will be notified
    _user.bindStream(auth.userChanges()); // user lai chai bind gareko
    //like user le signout gareko sign in gareko chai _user varaible ma update hunxa or bind hunxa
    ever(_user, _initialScreen);
    // _user chai listner ho jun firebase le pathauxa , tesko aadar ma initalscreen chalxa
  }

  _initialScreen(User? user) {
    if (user == null) {
      //user le login gareko xaina
      print("login page");
      Get.offAll(() => Login());
    } else {
      //login garko xa
      Get.offAll(() => Welcome(email: user.email));
    }
  }

//if user le successful register gayo vane _user chai live hunxa
//ani automatically welcome page ma janxa
  void register(String email, password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(        //trying to connect with firebase
          email: email, password: password);
      User ?user = result.user;
      //carete new document for user with uid
      await DatabaseService(uid: user?.uid).updateUserData(0, 28, 5, 25);

    } catch (e) {
      Get.snackbar("about user", "user message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("about login", "login message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void logout() async {
    auth.signOut();
  }
}
