import 'package:budget_app/models/categoryModel/category_model.dart';
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

class EditCategoryState extends AddCategoryState {
  EditCategoryState({
    required this.pickerColor,
    required this.incomeTextEditingController,
    required this.incomeCategoryNameText,
    required this.iconIndex,
    required this.categoryModel,
  });
  final String incomeCategoryNameText;
  final String pickerColor;
  final TextEditingController incomeTextEditingController;
  final int iconIndex;
  final CategoryModel categoryModel;

  @override
  List<Object?> get props => [
        pickerColor,
        incomeTextEditingController,
        incomeCategoryNameText,
        iconIndex,
        categoryModel,
      ];
}
