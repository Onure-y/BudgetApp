import 'package:budget_app/models/userModel/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AllMovementsState extends Equatable {}

class AllMovementsInitalState extends AllMovementsState {
  @override
  List<Object?> get props => [];
}

class AllMovementsLoadingState extends AllMovementsState {
  @override
  List<Object?> get props => [];
}

class AllMovementsLoadedState extends AllMovementsState {
  AllMovementsLoadedState({required this.userModel});

  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}
