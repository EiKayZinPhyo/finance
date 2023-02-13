import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();

  RxBool loginemailCheck = RxBool(false);
  RxBool loginpasswordCheck = RxBool(false);
  RxBool loginLoad = RxBool(false);

  RxString errorTextEmail = RxString("");
  RxString errorTextPassword = RxString("");

  RxBool visiblePassword = RxBool(false);

  void setVisible() {
    visiblePassword.value = !visiblePassword.value;
  }

  //  void login(String email, password) async {
  //   try {
  //     loginLoad.value = true;
  //     checkLogin.value = true;
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     Get.toNamed('/home');
  //     loginemailController.clear();
  //     loginpasswordController.clear();
  //   } catch (firebaseAuthException) {}
  // }

  void login(String email, String password) async {
    loginemailCheck.value = false;
    loginpasswordCheck.value = false;
    if (email.isEmpty) {
      loginemailCheck.value = true;
      loginLoad.value = false;
      errorTextEmail.value = "Email should not be empty";
    }
    if (password.isEmpty) {
      loginpasswordCheck.value = true;
      loginLoad.value = false;
      errorTextPassword.value = "Password should not be empty";
    } else {
      try {
        loginLoad.value = true;
        print("email is $email password is $password");
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        loginemailController.clear();
        loginpasswordController.clear();
        errorTextEmail.value = "";
        errorTextPassword.value = "";
        loginLoad.value = false;
        Get.toNamed('/home');
      } on FirebaseAuthException catch (e) {
        if (e.code == "wrong-password") {
          errorTextPassword.value = "Wrong Password";
          errorTextEmail.value = "";
        }

        if (errorTextPassword.isNotEmpty) {
          loginpasswordCheck.value = true;
        }
        if (errorTextEmail.isNotEmpty) {
          loginemailCheck.value = true;
        }
        loginLoad.value = false;
      } catch (e) {
        loginLoad.value = false;
      }
    }
  }
}
