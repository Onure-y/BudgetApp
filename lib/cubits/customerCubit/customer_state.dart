import 'package:budget_app/models/userModel/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerState extends Equatable {}

class CustomerInitalState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerLoadingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerLoadedState extends CustomerState {
  CustomerLoadedState({required this.userModel});
  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}
