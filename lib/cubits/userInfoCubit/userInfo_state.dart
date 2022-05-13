import 'package:budget_app/models/userModel/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserInfoState extends Equatable {}

class UserInfoInitialState extends UserInfoState {
  @override
  List<Object?> get props => [];
}

class UserInfoLoadingState extends UserInfoState {
  @override
  List<Object?> get props => [];
}

class UserInfoLoadedState extends UserInfoState {
  UserInfoLoadedState({required this.userModel});
  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}
