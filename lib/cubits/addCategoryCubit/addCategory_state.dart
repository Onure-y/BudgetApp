import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class AddCategoryState extends Equatable {}

class AddCategoryStateInitial extends AddCategoryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddCategoryStateLoading extends AddCategoryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddIncomeCategoryState extends AddCategoryState {
  AddIncomeCategoryState({
    required this.pickerColor,
    required this.incomeTextEditingController,
    required this.incomeCategoryNameText,
  });
  final String incomeCategoryNameText;
  final Color pickerColor;
  final TextEditingController incomeTextEditingController;
  @override
  List<Object?> get props =>
      [pickerColor, incomeTextEditingController, incomeCategoryNameText];
}

class AddExpenseCategoryState extends AddCategoryState {
  AddExpenseCategoryState({
    required this.pickerColor,
    required this.expenseTextEditingController,
    required this.expenseCategoryNameText,
  });
  final String expenseCategoryNameText;
  final Color pickerColor;
  final TextEditingController expenseTextEditingController;
  @override
  List<Object?> get props =>
      [pickerColor, expenseTextEditingController, expenseCategoryNameText];
}
