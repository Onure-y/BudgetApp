import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserExistState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserDemoTimeEnded extends UserState {
  @override
  List<Object?> get props => [];
}

class UserNotExistState extends UserState {
  UserNotExistState(
      {required this.firstNameTextController,
      required this.emailTextController,
      required this.companyNameTextController});

  final TextEditingController firstNameTextController;
  final TextEditingController emailTextController;
  final TextEditingController companyNameTextController;
  @override
  List<Object?> get props => [];
}
