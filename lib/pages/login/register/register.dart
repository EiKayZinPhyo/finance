import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../register/authcontroller.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //AuthController authController = AuthController();
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFffb8b8),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 104, 174),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, 'screenpage');
          },
        ),
        // backgroundColor: Color(0xFFffb8b8),
        elevation: 0.0,
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  "Create An Account",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  width: double.infinity,
                  child: const Text(
                    "Email",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: authController.emailController,
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
                    hintText: 'Enter your email',
                    errorText: authController.emailCheck.value
                        ? authController.errorTextEmail.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: double.infinity,
                  child: const Text(
                    "Password",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: authController.passwordController,
                  obscureText: authController.visiblePassword.value,
                  decoration: InputDecoration(
                    errorText: authController.passwordCheck.value
                        ? authController.errorTextPassword.value
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
                          print(authController.visiblePassword.value);
                          authController.setVisible();
                        },
                        icon: Icon(authController.visiblePassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    authController.register(authController.emailController.text,
                        authController.passwordController.text);
                    print("Scuccess");
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(247, 199, 71, 165)),
                  child: authController.load.isTrue
                      ? CircularProgressIndicator()
                      : Text("Register"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text('Already have an account?'),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('lprint');
                      Get.toNamed('/login');
                    },
                    child: Container(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 208, 12, 243),
                            fontSize: 18),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
