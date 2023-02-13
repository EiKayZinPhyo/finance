import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/homecontroller.dart';
import '../login/register/authcontroller.dart';
import '../routes/app_routes.dart';
import '../../model/expense_list.dart';
import '../constant/constant.dart';
import '../piechart/piechart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    AuthController authcontroller = Get.put(AuthController());
    controller.fetchIncome();
    controller.fetchExpenseList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.abc,
            size: 0,
          ),
          title: Text("Home", style: ConstantTextStyle.TextSytleColor),
          backgroundColor: Color.fromARGB(255, 164, 107, 174),
          actions: [
            IconButton(
                onPressed: () {
                  authcontroller.signOut();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return Container(
                  width: double.infinity,
                  height: 150,
                  child: PieChartPage(
                    totalIncome: controller.totalIncome.toDouble(),
                    totalExpense: controller.expenseNo.toDouble(),
                  ));
            }),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.INCOME);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purpleAccent),
                      icon: Icon(Icons.attach_money),
                      label: Text("Add Income")),
                ),
                Container(
                  width: 180,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.EXPENSEIMAGE);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purpleAccent),
                      icon: Icon(Icons.money_off),
                      label: Text("Add Expense")),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  height: 110,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 165, 164, 164),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Income Amount',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Obx(() => Text("${controller.totalIncome}")),
                      Text('kyats'),
                    ],
                  ),
                ),
                Container(
                  width: 180,
                  height: 110,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 165, 164, 164),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                        )
                      ]),
                  child: Column(
                    children: [
                      Text(
                        'Expense Amount',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Obx(() => Text("${controller.expenseNo}")),
                      Text('kyats'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            ExpenseList(),

            // Container(
            //   height: 200,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     color: Color.fromARGB(179, 227, 189, 189),
            //   ),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Container(
            //             child: Text("Income Amount"),
            //           ),
            //           Container(
            //             child: Text("Expense Amount"),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
