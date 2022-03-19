import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddCategoryMovementState extends Equatable {}

class AddCategoryMovementInitalState extends AddCategoryMovementState {
  @override
  List<Object?> get props => [];
}

class AddCategoryMovementLoadingState extends AddCategoryMovementState {
  @override
  List<Object?> get props => [];
}

class AddCategoryMovementTemplateState extends AddCategoryMovementState {
  AddCategoryMovementTemplateState({
    required this.movementTextController,
    required this.movementValueTextController,
    required this.categories,
  });

  final TextEditingController movementTextController;
  final TextEditingController movementValueTextController;
  final List<CategoryModel> categories;
  @override
  List<Object?> get props =>
      [categories, movementTextController, movementValueTextController];
}

class AddCategoryMovementLoadedState extends AddCategoryMovementState {
  AddCategoryMovementLoadedState({
    required this.movementTextController,
    required this.movementValueTextController,
    required this.categories,
    required this.category,
  });

  final TextEditingController movementTextController;
  final TextEditingController movementValueTextController;
  final List<CategoryModel> categories;
  final CategoryModel category;
  @override
  List<Object?> get props =>
      [categories, movementTextController, movementValueTextController];
}
