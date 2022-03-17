import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddClientState extends Equatable {}

class AddClientInitialState extends AddClientState {
  @override
  List<Object?> get props => [];
}

class AddClientLoadingState extends AddClientState {
  @override
  List<Object?> get props => [];
}

class AddClientLoadedState extends AddClientState {
  AddClientLoadedState({
    required this.formList,
    required this.firstName,
    required this.lastName,
    required this.clientContainerColor,
    required this.iconIndex,
  });

  final List<Map<String, dynamic>> formList;
  final String firstName;
  final String lastName;
  final Color clientContainerColor;
  final int iconIndex;
  @override
  List<Object?> get props =>
      [formList, firstName, clientContainerColor, lastName, iconIndex];
}
