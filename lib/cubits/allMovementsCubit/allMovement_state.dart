import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  AllMovementsLoadedState({
    required this.movements,
    required this.scrollController,
    required this.allCustomers,
    required this.allCategories,
  });

  final List<MovementModel> movements;
  final ScrollController scrollController;
  final List<CustomerModel> allCustomers;
  final List<CategoryModel> allCategories;

  @override
  List<Object?> get props =>
      [movements, scrollController, allCustomers, allCategories];
}
