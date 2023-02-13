import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_finance_getx/pages/expense/expensecontroller.dart';

import '../constant/constant.dart';
import '../home/homepage.dart';

class Expense extends GetView<ExpenseController> {
  Expense({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ExpenseController controller = ExpenseController();

    final argument = Get.arguments;

    String labelName = "";
    if (argument != null) {
      labelName = argument[0];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense", style: ConstantTextStyle.TextSytleColor),
        backgroundColor: Color.fromARGB(255, 164, 107, 174),
        leading: IconButton(
          onPressed: () {
            Get.to(HomePage());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            width: 100,
            child: Text("Amount"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: controller.expenseamount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                controller.addExpense(labelName);
              },
              style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
              icon: Obx(
                () => controller.expenseload.isTrue
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Icon(Icons.save),
              ),
              label: Text("Add Expense"),
            ),
          ),
        ],
      ),
    );
  }
}
