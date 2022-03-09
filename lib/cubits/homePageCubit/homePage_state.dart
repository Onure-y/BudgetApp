import 'package:budget_app/models/userModel/user_model.dart';
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
  HomePageLoadedState({required this.userModel});

  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}
