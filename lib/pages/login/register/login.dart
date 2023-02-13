import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../register/logincontroller.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 150),
              child: const Text(
                "Welcome Back",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Container(
              child: const Text(
                "Please Enter your detail",
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.loginemailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.all(20),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.person,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Enter your username',
                  errorText: controller.loginemailCheck.value
                      ? controller.errorTextEmail.toString()
                      : null,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller.loginpasswordController,
                obscureText: controller.visiblePassword.value,
                decoration: InputDecoration(
                  errorText: controller.loginpasswordCheck.value
                      ? controller.errorTextPassword.toString()
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.lock,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Enter your Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        print(controller.visiblePassword.value);
                        controller.setVisible();
                      },
                      icon: Icon(controller.visiblePassword.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  controller.login(controller.loginemailController.text,
                      controller.loginpasswordController.text);
                  print("Scuccess");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(247, 199, 71, 165)),
                child: controller.loginLoad.isTrue
                    ? CircularProgressIndicator()
                    : Text("Login"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text('Don`t have an account?'),
                ),
                GestureDetector(
                  onTap: () {
                    print('lprint');
                    Get.toNamed('/register');
                  },
                  child: Container(
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Color.fromARGB(255, 160, 105, 147),
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            )
          ]),
        );
      }),
    );
  }
}
