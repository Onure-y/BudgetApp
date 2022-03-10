import 'package:budget_app/models/userModel/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {}

class CategoryInitalState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState({required this.userModel});
  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}
