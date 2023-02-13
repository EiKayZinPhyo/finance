import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home/homecontroller.dart';

import '../constant/constant.dart';
import '../home/homepage.dart';

class SingleExpense extends StatelessWidget {
  const SingleExpense({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    final argument = Get.arguments;
    if (argument != null) {
      final labelName = argument[0];
      controller.filiterExpenseList(labelName);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense", style: ConstantTextStyle.TextSytleColor),
          backgroundColor: Color.fromARGB(255, 164, 107, 174),
          leading: IconButton(
            onPressed: () {
              Get.to(HomePage());
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Obx(() {
          return controller.fliterList.isEmpty
              ? const Center(
                  child: Text(
                  "No data",
                  style: TextStyle(color: Colors.black),
                ))
              : ListView.builder(
                  itemCount: controller.fliterList.length,
                  shrinkWrap: false,
                  itemBuilder: ((context, index) {
                    final data = controller.fliterList[index];
                    var format = DateFormat('d MMM, hh:mm a');
                    var date = DateTime.fromMillisecondsSinceEpoch(
                        data.createdAt.seconds * 1000);
                    return Column(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: const Color.fromARGB(255, 230, 180, 239),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(data.label.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(data.title.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.amount.toString(),
                                        style: const TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 15),
                                      ),
                                      Text(format.format(date)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                );
        }));
  }
}
