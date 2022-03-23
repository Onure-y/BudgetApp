import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/homePageCubit/homePage_state.dart';
import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:budget_app/views/main_view.dart';
import 'package:flutter/material.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.userRepository})
      : super(HomePageInitialState()) {
    emit(HomePageLoadingState());
    initState();
  }

  late UserModel userModel;
  final UserRepository userRepository;
  List<MovementModel> currentDateTimeIncomeMovements = [];
  List<MovementModel> currentDateTimeExpenseMovements = [];
  List<ChartData> monthlyIncomeMovements = [];
  List<ChartData> monthlyExpenseMovements = [];
  double incomeValue = 0;
  double expenseValue = 0;
  double budgetValue = 0;
  double incomeDeg = 0;

  Future getUserData() async {
    emit(HomePageLoadingState());
    userModel = await userRepository.getUserData();
    emit(HomePageLoadedState(
        userModel: userModel,
        incomeMovements: currentDateTimeIncomeMovements,
        expenseMovements: currentDateTimeExpenseMovements,
        incomeValue: incomeValue,
        expenseValue: expenseValue,
        budgetValue: budgetValue,
        incomeDeg: incomeDeg,
        monthlyIncomeMovements: monthlyIncomeMovements,
        monthlyExpenseMovements: monthlyExpenseMovements));
  }

  Future initState() async {
    await getUserData();
    await getCurrentMonthIncomeMovement();
    await calculateIncomeValueForCurrentMonth();
    await calculateExpenseValueForCurrentMonth();
    await calculateBudgetValueForCurrentMonth();
    await calculateDegrees();
    await getCurrentMonthIncomeList();
    await getCurrentMonthExpenseList();
    emit(
      HomePageLoadedState(
          userModel: userModel,
          incomeMovements: currentDateTimeIncomeMovements,
          expenseMovements: currentDateTimeExpenseMovements,
          incomeValue: incomeValue,
          expenseValue: expenseValue,
          budgetValue: budgetValue,
          incomeDeg: incomeDeg,
          monthlyIncomeMovements: monthlyIncomeMovements,
          monthlyExpenseMovements: monthlyExpenseMovements),
    );
  }

  Future getCurrentMonthIncomeMovement() async {
    DateTime currentDateTime = DateTime.now();
    UserModel userData = await userRepository.getUserData();
    int year = currentDateTime.year;
    int month = currentDateTime.month;
    List<MovementModel> movementModels = userData.allMovements;

    for (var i = 0; i < movementModels.length; i++) {
      DateTime modelDateTime =
          DateTime.fromMillisecondsSinceEpoch(movementModels[i].time);
      if (year == modelDateTime.year && month == modelDateTime.month) {
        if (movementModels[i].movementValue > 0) {
          currentDateTimeIncomeMovements.add(movementModels[i]);
        } else {
          currentDateTimeExpenseMovements.add(movementModels[i]);
        }
      }
    }
  }

  Future calculateIncomeValueForCurrentMonth() async {
    for (var i = 0; i < currentDateTimeIncomeMovements.length; i++) {
      incomeValue =
          incomeValue + currentDateTimeIncomeMovements[i].movementValue;
    }
  }

  Future calculateExpenseValueForCurrentMonth() async {
    for (var i = 0; i < currentDateTimeExpenseMovements.length; i++) {
      expenseValue =
          expenseValue + currentDateTimeExpenseMovements[i].movementValue;
    }
  }

  Future calculateBudgetValueForCurrentMonth() async {
    budgetValue = incomeValue + expenseValue;
  }

  Future calculateDegrees() async {
    double allValue = incomeValue + expenseValue.abs();
    incomeDeg = (incomeValue / allValue) * 360;
  }

  Future getCurrentMonthIncomeList() async {
    List<MovementModel> allMovements = userModel.allMovements;
    DateTime currentDateTime = DateTime.now();
    for (MovementModel i in allMovements) {
      if (DateTime.fromMillisecondsSinceEpoch(i.time).month ==
              currentDateTime.month &&
          DateTime.fromMillisecondsSinceEpoch(i.time).year ==
              currentDateTime.year &&
          i.movementValue > 0) {
        if (monthlyIncomeMovements.isEmpty) {
          monthlyIncomeMovements.add(ChartData(
              DateTime.fromMillisecondsSinceEpoch(i.time).day.toString(),
              i.movementValue));
        } else {
          // debugPrint(allMovements[allMovements.length - 1].movementText);

          List<ChartData> emptyChartData = [];
          for (ChartData j in monthlyIncomeMovements) {
            debugPrint(i.movementText);
            if (j.x ==
                DateTime.fromMillisecondsSinceEpoch(i.time).day.toString()) {
              j.y = j.y! + i.movementValue;
            } else {
              emptyChartData.add(
                ChartData(
                  DateTime.fromMillisecondsSinceEpoch(i.time).day.toString(),
                  i.movementValue,
                ),
              );
            }
          }
          emptyChartData.isNotEmpty
              ? monthlyIncomeMovements.add(emptyChartData[0])
              : {};
        }
      }
    }
  }

  Future getCurrentMonthExpenseList() async {
    List<MovementModel> allMovements = userModel.allMovements;
    DateTime currentDateTime = DateTime.now();
    for (MovementModel i in allMovements) {
      if (DateTime.fromMillisecondsSinceEpoch(i.time).month ==
              currentDateTime.month &&
          DateTime.fromMillisecondsSinceEpoch(i.time).year ==
              currentDateTime.year &&
          i.movementValue < 0) {
        if (monthlyExpenseMovements.isEmpty) {
          monthlyExpenseMovements.add(
            ChartData(
                DateTime.fromMillisecondsSinceEpoch(i.time).day.toString(),
                i.movementValue),
          );
        } else {
          List<ChartData> emptyChartData = [];
          for (ChartData j in monthlyExpenseMovements) {
            if (j.x ==
                DateTime.fromMicrosecondsSinceEpoch(i.time).day.toString()) {
              j.y = j.y! + i.movementValue;
            } else {
              emptyChartData.add(
                ChartData(
                  DateTime.fromMillisecondsSinceEpoch(i.time).day.toString(),
                  i.movementValue,
                ),
              );
            }
          }
          emptyChartData.isNotEmpty
              ? monthlyExpenseMovements.add(emptyChartData[0])
              : {};
        }
      }
    }
  }
}
