import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/homepage.dart';

class IncomeController extends GetxController {
  RxBool incomeLoad = RxBool(false);
  TextEditingController numberController = TextEditingController();

  Future<void> addIncome() async {
    final String title = '';

    final double amount = double.parse(numberController.text);
    try {
      incomeLoad.value = true;
      var data = FirebaseFirestore.instance
          .collection("income")
          .doc(FirebaseAuth.instance.currentUser?.uid.toString())
          .collection("total_income");

      var result = await data.add({"title": title, "amount": amount});
      incomeLoad.value = false;
      print("Hello income $result");
      Get.to(HomePage());
    } catch (e) {
      // print(e.toString());
      print("error");
      // load.value = false;
    }
  }
}
