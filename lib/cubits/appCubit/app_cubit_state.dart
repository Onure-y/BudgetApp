import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {}

class AppInitial extends AppState {
  @override
  List<Object?> get props => [];
}

class AppLoading extends AppState {
  @override
  List<Object?> get props => [];
}

class HomePageState extends AppState {
  @override
  List<Object?> get props => [];
}

class AllMovementPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class OverviewPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class IncomeCategoryPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class ExpenseCategoryPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class ClientPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class AddIncomeCategoryPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class AddExpenseCategoryPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class AddClientPageState extends AppState {
  @override
  List<Object?> get props => [];
}
