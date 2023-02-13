import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class AuthController extends GetxController {
  //static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();

  RxBool load = RxBool(false);
  RxBool emailCheck = RxBool(false);
  RxBool passwordCheck = RxBool(false);
  RxBool checkLogin = RxBool(false);
  RxBool passwordVisible = RxBool(false);
  RxBool loginLoad = RxBool(false);

  // var userErrorText = ''.obs;
  // var passwordText = ''.obs;

  RxString errorTextEmail = RxString("");
  RxString errorTextPassword = RxString("");

  RxBool visiblePassword = RxBool(false);

  // String? get emailErrorText {
  //   if (userErrorText.value.isEmpty) {
  //     return " Email can't be blank";
  //   }
  //   return null;
  // }

  // String? get passwordErrorText {
  //   if (passwordText.value.isEmpty) {
  //     return "Password can't be blank";
  //   }
  //   return null;
  // }

  var loginemailtext = ''.obs;
  var loginpasswordText = ''.obs;

  String? get loginemailErrorText {
    if (loginemailtext.value.isEmpty) {
      return " Email can't be blank";
    }
    return null;
  }

  String? get loginpasswordErrorText {
    if (loginpasswordText.value.isEmpty) {
      return "Password can't be blank";
    }
    return null;
  }

  void setVisible() {
    visiblePassword.value = !visiblePassword.value;
  }

  void register(String email, String password) async {
    emailCheck.value = false;
    passwordCheck.value = false;
    if (email.isEmpty) {
      emailCheck.value = true;
      load.value = false;
      errorTextEmail.value = "Email should not be empty";
    }
    if (password.isEmpty) {
      passwordCheck.value = true;
      load.value = false;
      errorTextPassword.value = "Password should not be empty";
    } else {
      if (password.length < 8) {
        passwordCheck.value = true;
        load.value = false;
        errorTextPassword.value = "Password must have at least 8 characters.";
      } else {
        try {
          load.value = true;
          print("email is $email password is $password");
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
          emailController.clear();
          passwordController.clear();
          errorTextEmail.value = "";
          errorTextPassword.value = "";
          load.value = false;
          Get.toNamed('/login');
        } on FirebaseAuthException catch (e) {
          if (e.code == "email-already-in-use") {
            errorTextEmail.value = "Email is already in use";
            errorTextPassword.value = "";
          }
          if (errorTextEmail.isNotEmpty) {
            emailCheck.value = true;
          }
          if (errorTextPassword.isNotEmpty) {
            passwordCheck.value = true;
          }
          load.value = false;
        } catch (e) {
          print(e);
          load.value = false;
        }
      }
    }
  }

  void login(String email, password) async {
    try {
      loginLoad.value = true;
      checkLogin.value = true;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.toNamed('/home');
      loginemailController.clear();
      loginpasswordController.clear();
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed('/login');
  }
}
