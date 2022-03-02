import 'package:bloc/bloc.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategoryCubi_state.dart';
import 'package:flutter/cupertino.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryStateInitial()) {
    emit(AddCategoryStateLoading());
    emit(AddIncomeCategoryState(pickerColor: pickerColor));
  }

  Color pickerColor = incomeColor;

  void changeColor(Color color) {
    pickerColor = color;
    emit(AddIncomeCategoryState(pickerColor: pickerColor));
  }

  void addIncomeCategoryInToDatabase() {}

  void addExpenseCategoryInToDatabase() {}
}
