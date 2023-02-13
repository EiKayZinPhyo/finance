import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff3881C7),
          body: Stack(
            children: [
              const Positioned(
                top: 30,
                left: 25,
                child: Text(
                  "Finance App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  top: 80,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Carrying out financial transcations,',
                        style: ConstantTextStyle.splashTextStyle,
                      ),
                      Text(
                        'wtih the best security',
                        style: ConstantTextStyle.splashTextStyle,
                      )
                    ],
                  )),
              Positioned(
                top: 150,
                child: Image.asset(
                  'asset/splash.png',
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.cover,
                  width: 460,
                ),
              ),
              Positioned(
                top: 600,
                child: Container(
                  width: 330,
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xffE98916)),
                    child: const Text("Get Started"),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
