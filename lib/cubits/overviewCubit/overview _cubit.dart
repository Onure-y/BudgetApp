import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/overviewCubit/overview_state.dart';
import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:budget_app/views/overview_view.dart';

class OverviewCubit extends Cubit<OverviewPageState> {
  OverviewCubit({required this.userRepository})
      : super(OverviewPageInitalState()) {
    emit(OverviewPageLoadingState());
    initCubit();
  }
  final UserRepository userRepository;
  double yearlyIncome = 0;
  double yearlyExpense = 0;
  double yearlyIncomeDeg = 0;

  List<OverviewChartModel> yearlyIncomeMovements = [];
  List<OverviewChartModel> yearlyExpenseMovements = [];

  Future initCubit() async {
    await calculateYearlyIncomeAndExpense();
    calculateYearlyIncomeDeg();
    await getCurrentYearyIncomeList();
    emit(OverviewPageLoadedState(
      yearlyIncome: yearlyIncome,
      yearlyExpense: yearlyExpense,
      yearlyIncomeDeg: yearlyIncomeDeg,
      yearlyIncomeMovements: yearlyIncomeMovements,
    ));
  }

  void calculateYearlyIncomeDeg() async {
    double allValue = yearlyIncome + yearlyExpense.abs();
    yearlyIncomeDeg = (yearlyIncome / allValue) * 360;
  }

  Future<List<MovementModel>> getUserYearlyMovements() async {
    List<MovementModel> movements =
        await userRepository.getUserCurrentYearMovements();
    return movements;
  }

  Future calculateYearlyIncomeAndExpense() async {
    List<MovementModel> movements = await getUserYearlyMovements();
    double income = 0;
    double expense = 0;
    for (MovementModel movement in movements) {
      if (movement.movementValue > 0) {
        income = income + movement.movementValue;
      } else {
        expense = expense + movement.movementValue;
      }
    }
    yearlyIncome = income;
    yearlyExpense = expense;
  }

  Future getCurrentYearyIncomeList() async {
    List<MovementModel> allMovements = await getUserYearlyMovements();
    DateTime currentDateTIme = DateTime.now();

    for (MovementModel movement in allMovements) {
      if (movement.movementValue > 0) {
        if (yearlyIncomeMovements.isEmpty) {
          int month = DateTime.fromMillisecondsSinceEpoch(movement.time).month;
          debugPrint('created');
          yearlyIncomeMovements.add(
            OverviewChartModel(
              month: month - 1,
              moneyValue: movement.movementValue,
            ),
          );
        } else {
          OverviewChartModel emptyChartData =
              OverviewChartModel(month: 13, moneyValue: 0);
          if (yearlyIncomeMovements.last.month ==
              (DateTime.fromMillisecondsSinceEpoch(movement.time).month - 1)) {
            debugPrint('annen');
            yearlyIncomeMovements.last.moneyValue =
                yearlyIncomeMovements.last.moneyValue + movement.movementValue;
          } else {
            emptyChartData = OverviewChartModel(
              month:
                  DateTime.fromMillisecondsSinceEpoch(movement.time).month - 1,
              moneyValue: movement.movementValue,
            );
          }
          emptyChartData.month == 13
              ? {}
              : yearlyIncomeMovements.add(emptyChartData);
        }
      }
    }
  }
}
