import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../constant/expense_check.dart';
import '../../model/expenseclass.dart';

class HomeController extends GetxController {
  RxDouble totalIncome = RxDouble(0.0);
  RxBool totalBool = RxBool(false);
  //double totalIncome = 0.0;
  RxDouble expenseNo = RxDouble(0.0);

  RxList<ExpenseClass> eachExpenseList = RxList();
  RxList<ExpenseClass> totalExpenseList = RxList();
  RxList<ExpenseClass> fliterList = RxList();

  void fetchIncome() async {
    double tempTotalIncome = 0.0;
    var data = FirebaseFirestore.instance
        .collection("income")
        .doc(FirebaseAuth.instance.currentUser?.uid.toString())
        .collection("total_income");

    var result = await data.get();
    result.docs.forEach((element) {
      tempTotalIncome += double.parse(element['amount'].toString());
    });
    totalIncome.value = tempTotalIncome;
  }

  void fetchTotalExpense() async {
    double tempTotalExpense = 0.0;
    double tempFoodExpense = 0.0;
    double tempClothExpense = 0.0;
    double tempEntertinmentExpense = 0.0;
    double tempFuelExpense = 0.0;
    double tempGroceryExpense = 0.0;
    double tempgymExpense = 0.0;
    double temphealthExpense = 0.0;
    double temphouseExpense = 0.0;
    double tempservicesExpesne = 0.0;
    double temptravelExpensee = 0.0;

    for (ExpenseClass element in totalExpenseList) {
      if (element.label == ExpenseCheck.cloth.name) {
        tempClothExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.gym.name) {
        tempgymExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.health.name) {
        temphealthExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.house.name) {
        temphouseExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.travel.name) {
        temptravelExpensee += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.fuel.name) {
        tempFuelExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.entertainment.name) {
        tempEntertinmentExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.grocery.name) {
        tempGroceryExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.food.name) {
        tempFoodExpense += double.parse(element.amount.toString());
      } else if (element.label == ExpenseCheck.services.name) {
        tempservicesExpesne += double.parse(element.amount.toString());
      }
      tempTotalExpense += double.parse(element.amount.toString());
    }
    expenseNo.value = tempTotalExpense;
    eachExpenseList.clear();
    eachExpenseList.add(ExpenseClass(
        title: 'Cloth',
        amount: tempClothExpense,
        label: ExpenseCheck.cloth.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Food',
        amount: tempFoodExpense,
        label: ExpenseCheck.food.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Entertinment',
        amount: tempEntertinmentExpense,
        label: ExpenseCheck.entertainment.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Fuel',
        amount: tempFuelExpense,
        label: ExpenseCheck.fuel.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Grocery',
        amount: tempGroceryExpense,
        label: ExpenseCheck.grocery.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Gym',
        amount: tempgymExpense,
        label: ExpenseCheck.gym.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Health',
        amount: temphealthExpense,
        label: ExpenseCheck.health.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'House',
        amount: temphouseExpense,
        label: ExpenseCheck.house.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Services',
        amount: tempservicesExpesne,
        label: ExpenseCheck.services.name,
        createdAt: DateTime.now()));

    eachExpenseList.add(ExpenseClass(
        title: 'Travel',
        amount: temptravelExpensee,
        label: ExpenseCheck.travel.name,
        createdAt: DateTime.now()));
    eachExpenseList.removeWhere((element) => element.amount <= 0);
  }

  void fetchExpenseList() async {
    var data = FirebaseFirestore.instance
        .collection("expense")
        .doc(FirebaseAuth.instance.currentUser?.uid.toString())
        .collection("new_expense");

    var result = await data.get();
    List<ExpenseClass> emptyList = [];

    final docker = result.docs;

    for (final singleDoc in docker) {
      ExpenseClass ex = ExpenseClass(
          title: singleDoc['title'],
          amount: double.parse(singleDoc['amount'].toString()),
          label: singleDoc['label'],
          createdAt: singleDoc['create_at']);
      emptyList.add(ex);
    }

    totalExpenseList.clear();
    totalExpenseList.addAll(emptyList);
    emptyList.clear();
    fetchTotalExpense();
    print("total expense $expenseNo");
  }

  filiterExpenseList(String label) {
    List<ExpenseClass> tempList = [];
    for (ExpenseClass data in totalExpenseList) {
      if (data.label == label) {
        tempList.add(data);
      }
    }
    fliterList.clear();
    fliterList.addAll(tempList);
  }
}
