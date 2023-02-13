import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/homepage.dart';
import '../income/incomecontroller.dart';

import '../constant/constant.dart';

class Income extends GetView<IncomeController> {
  @override
  IncomeController controller = IncomeController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income", style: ConstantTextStyle.TextSytleColor),
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
            width: 100,
            padding: EdgeInsets.only(left: 20),
            child: Text("Amount"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: controller.numberController,
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
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                controller.addIncome();
              },
              style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
              icon: Obx(
                () => controller.incomeLoad.isTrue
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Icon(Icons.save),
              ),
              label: const Text("Add Income"),
            ),
          ),
        ],
      ),
    );
  }
}
