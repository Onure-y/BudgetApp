import 'package:bloc/bloc.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategory_state.dart';
import 'package:flutter/cupertino.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryStateInitial()) {
    emit(AddCategoryStateLoading());
  }
  Color expensePickerColor = expenseColor;
  Color incomePickerColor = incomeColor;

  String incomeCategoryNameText = 'Kategori ismi';
  String expenseCategoryNameText = 'Kategori ismi';

  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController expenseTextEditingController = TextEditingController();

  void goToAddIncomeCategoryPage() {
    emit(AddIncomeCategoryState(
        pickerColor: incomePickerColor,
        incomeTextEditingController: incomeTextEditingController,
        incomeCategoryNameText: incomeCategoryNameText));
  }

  void goToAddExpenseCategoryPage() {
    emit(AddExpenseCategoryState(
      pickerColor: expensePickerColor,
      expenseTextEditingController: expenseTextEditingController,
      expenseCategoryNameText: expenseCategoryNameText,
    ));
  }

  void changeColorForIncomePage(Color color) {
    incomePickerColor = color;
    emit(AddIncomeCategoryState(
        pickerColor: incomePickerColor,
        incomeTextEditingController: incomeTextEditingController,
        incomeCategoryNameText: incomeCategoryNameText));
  }

  void changeColorForExpensePage(Color color) {
    expensePickerColor = color;
    emit(AddExpenseCategoryState(
      pickerColor: expensePickerColor,
      expenseTextEditingController: expenseTextEditingController,
      expenseCategoryNameText: expenseCategoryNameText,
    ));
  }

  void changeIncomeText() {
    incomeCategoryNameText = incomeTextEditingController.text;
    emit(AddIncomeCategoryState(
        pickerColor: incomePickerColor,
        incomeTextEditingController: incomeTextEditingController,
        incomeCategoryNameText: incomeCategoryNameText));
  }

  void changeExpenseText() {
    expenseCategoryNameText = expenseTextEditingController.text;
    emit(AddExpenseCategoryState(
      pickerColor: expensePickerColor,
      expenseTextEditingController: expenseTextEditingController,
      expenseCategoryNameText: expenseCategoryNameText,
    ));
  }

  void addIncomeCategoryInToDatabase() {}

  void addExpenseCategoryInToDatabase() {}
}
