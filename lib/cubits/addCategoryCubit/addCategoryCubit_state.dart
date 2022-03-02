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
  AddIncomeCategoryState({required this.pickerColor});
  final Color pickerColor;
  @override
  List<Object?> get props => [pickerColor];
}

class AddExpenseCategoryState extends AddCategoryState {
  @override
  List<Object?> get props => [];
}
