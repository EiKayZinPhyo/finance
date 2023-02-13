import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';
import '../home/homepage.dart';

class ExpenseImage extends StatefulWidget {
  const ExpenseImage({Key? key}) : super(key: key);

  @override
  State<ExpenseImage> createState() => _ExpenseImageState();
}

class _ExpenseImageState extends State<ExpenseImage> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('expense_image')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.length > 0) {
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot data =
                            snapshot.data!.docs.elementAt(index);
                        print("data is ${data['check']}");
                        return GestureDetector(
                          onTap: () {
                            final result = data['check'];
                            Get.toNamed(
                              "/expense",
                              arguments: [result],
                            );
                          },
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  data["image"],
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(data['title']),
                                ),
                              ],
                            ),
                          ),
                        );
                        //Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     SizedBox(
                        //       height: 20,
                        //     ),
                        //     Container(
                        //       child: Card(
                        //         child: Image.network(
                        //           data['image'],
                        //           height: 80,
                        //         ),
                        //       ),
                        //     ),
                        //     Text(
                        //       data['title'],
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ],
                        // ),
                        //);
                        //),

                        // Text(data['title']),
                      });
                }
              }

              return SpinKitFadingCube(
                color: Colors.purpleAccent,
                size: 20,
              );
            }),
      ),
    );
  }
}
