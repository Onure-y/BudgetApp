import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/views/main_view.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {}

class HomePageInitialState extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageLoadingState extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageLoadedState extends HomePageState {
  HomePageLoadedState({
    required this.userModel,
    required this.incomeMovements,
    required this.expenseMovements,
    required this.incomeValue,
    required this.expenseValue,
    required this.budgetValue,
    required this.incomeDeg,
    required this.monthlyIncomeMovements,
    required this.monthlyExpenseMovements,
  });

  final UserModel userModel;
  final List<MovementModel> incomeMovements;
  final List<MovementModel> expenseMovements;
  final double incomeValue;
  final double expenseValue;
  final double budgetValue;
  final double incomeDeg;
  final List<ChartData> monthlyIncomeMovements;
  final List<ChartData> monthlyExpenseMovements;
  @override
  List<Object?> get props => [
        userModel,
        incomeMovements,
        expenseMovements,
        incomeValue,
        expenseValue,
        budgetValue,
        incomeDeg,
        monthlyIncomeMovements,
        monthlyExpenseMovements,
      ];
}
