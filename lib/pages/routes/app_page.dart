import 'package:get/get.dart';
import '../expense/expense.dart';
import '../expense/expenseimage.dart';

import '../expense/single_expense.dart';
import '../home/homepage.dart';
import '../income/income.dart';
import '../login/register/login.dart';
import '../login/register/register.dart';
import '../splash/splash_binding.dart';
import '../splash/splashpage.dart';
import 'app_routes.dart';

class App {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
      name: Routes.INCOME,
      page: () => Income(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.EXPENSE,
      page: () => Expense(),
    ),
    GetPage(
      name: Routes.EXPENSEIMAGE,
      page: () => const ExpenseImage(),
    ),
    GetPage(
      name: Routes.rRouteSingleExpense,
      page: () => const SingleExpense(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const Register(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
    ),
  ];
}
