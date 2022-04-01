import 'package:budget_app/views/overview_view.dart';
import 'package:equatable/equatable.dart';

abstract class OverviewPageState extends Equatable {}

class OverviewPageInitalState extends OverviewPageState {
  @override
  List<Object?> get props => [];
}

class OverviewPageLoadingState extends OverviewPageState {
  @override
  List<Object?> get props => [];
}

class OverviewPageLoadedState extends OverviewPageState {
  OverviewPageLoadedState({
    required this.yearlyIncome,
    required this.yearlyExpense,
    required this.yearlyIncomeDeg,
    required this.yearlyIncomeMovements,
    required this.yearlyExpenseMovements,
  });
  final double yearlyIncome;
  final double yearlyExpense;
  final double yearlyIncomeDeg;
  final List<OverviewChartModel> yearlyIncomeMovements;
  final List<OverviewChartModel> yearlyExpenseMovements;
  @override
  List<Object?> get props => [
        yearlyIncome,
        yearlyExpense,
        yearlyIncomeDeg,
        yearlyIncomeMovements,
        yearlyExpenseMovements,
      ];
}
