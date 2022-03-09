import 'package:budget_app/models/userModel/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {}

class SettingsInitalState extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsLoadingState extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsLoadedState extends SettingsState {
  SettingsLoadedState({required this.userModel});
  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}
