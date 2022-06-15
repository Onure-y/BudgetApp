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

class EditCategoryPageState extends AppState {
  EditCategoryPageState({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class EditClientPageState extends AppState {
  EditClientPageState({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class AddChooseMovementTypePageState extends AppState {
  @override
  List<Object?> get props => [];
}

class AddCategoryMovementPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class AddCustomerMovementPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class AddClientPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class SettingsPageState extends AppState {
  @override
  List<Object?> get props => [];
}

class ProfilePageState extends AppState {
  @override
  List<Object?> get props => [];
}
