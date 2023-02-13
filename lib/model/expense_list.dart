import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/homecontroller.dart';
import '../pages/routes/app_routes.dart';

class ExpenseList extends StatelessWidget {
  //ExpenseList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return SizedBox(
        height: 210,
        // color: Colors.white,
        child: Obx(() {
          return controller.eachExpenseList.isEmpty
              ? const Center(
                  child: Text(
                  "No data",
                  style: TextStyle(color: Colors.black),
                ))
              : ListView.builder(
                  itemCount: controller.eachExpenseList.length,
                  shrinkWrap: false,
                  itemBuilder: ((context, index) {
                    final data = controller.eachExpenseList[index];

                    // var format = DateFormat('d MMM, hh:mm a');
                    // var date = DateTime.fromMillisecondsSinceEpoch(
                    //     data.createdAt.seconds * 1000);
                    // print(format.format(date));

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.rRouteSingleExpense,
                                arguments: [data.label]);
                          },
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              color: Color.fromARGB(255, 185, 127, 153),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(data.title.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 10.0),
                                  //   child: Text(data.title.toString(),
                                  //       style: const TextStyle(
                                  //         color: Colors.white,
                                  //       )),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, left: 10),
                                    child: Text(
                                      data.amount.toString(),
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 244, 235, 235),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
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
