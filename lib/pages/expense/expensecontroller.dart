import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class ExpenseController extends GetxController {
  TextEditingController expenseamount = TextEditingController();
  TextEditingController expensename = TextEditingController();

  RxBool expenseload = RxBool(false);

  void addExpense(String labelName) async {
    final String title = expensename.text;
    final double amount = double.parse(expenseamount.text);

    if (labelName.isNotEmpty) {
      try {
        expenseload.value = true;
        var data = FirebaseFirestore.instance
            .collection("expense")
            .doc(FirebaseAuth.instance.currentUser?.uid.toString())
            .collection("new_expense");
        await data.add({
          "title": title,
          "amount": amount,
          "label": labelName,
          "create_at": FieldValue.serverTimestamp()
        });
        expenseload.value = false;
        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        print(e.toString());
        RxBool(false);
      }
    }
  }
}
