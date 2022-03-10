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
    required this.iconIndex,
  });
  final String incomeCategoryNameText;
  final String pickerColor;
  final TextEditingController incomeTextEditingController;
  final int iconIndex;

  @override
  List<Object?> get props => [
        pickerColor,
        incomeTextEditingController,
        incomeCategoryNameText,
        iconIndex
      ];
}

class AddExpenseCategoryState extends AddCategoryState {
  AddExpenseCategoryState({
    required this.pickerColor,
    required this.expenseTextEditingController,
    required this.expenseCategoryNameText,
    required this.iconIndex,
  });
  final String expenseCategoryNameText;
  final String pickerColor;
  final TextEditingController expenseTextEditingController;
  final int iconIndex;
  @override
  List<Object?> get props => [
        pickerColor,
        expenseTextEditingController,
        expenseCategoryNameText,
        iconIndex
      ];
}
