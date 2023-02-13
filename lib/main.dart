import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:personal_finance_getx/pages/routes/app_page.dart';
import 'package:personal_finance_getx/pages/routes/app_routes.dart';
import 'app/transcations/transcations.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // print(FirebaseAuth.instance.currentUser);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    locale: const Locale('pt', 'BR'),
    initialRoute: FirebaseAuth.instance.currentUser != null
        ? Routes.HOME
        : Routes.REGISTER,
    getPages: App.pages,
    translationsKeys: AppTranslation.translations,
  ));
}
