import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddCustomerMovementState extends Equatable {}

class AddCustomerMovementInitalState extends AddCustomerMovementState {
  @override
  List<Object?> get props => [];
}

class AddCustomerMovementLoadingState extends AddCustomerMovementState {
  @override
  List<Object?> get props => [];
}

class AddCustomerMovementTemplateState extends AddCustomerMovementState {
  AddCustomerMovementTemplateState(
      {required this.movementTextController,
      required this.movementValueController,
      required this.customers});

  final TextEditingController movementTextController;
  final TextEditingController movementValueController;
  final List<CustomerModel> customers;
  @override
  List<Object?> get props =>
      [movementTextController, movementValueController, customers];
}

class AddCustomerMovementLoadedState extends AddCustomerMovementState {
  AddCustomerMovementLoadedState(
      {required this.movementTextController,
      required this.movementValueController,
      required this.customer});

  final TextEditingController movementTextController;
  final TextEditingController movementValueController;
  final CustomerModel customer;
  @override
  List<Object?> get props =>
      [movementTextController, movementValueController, customer];
}
