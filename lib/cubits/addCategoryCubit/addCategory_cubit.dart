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

  int iconIndex = 8;

  String incomePickerStringColor = '';
  String expensePickerStringCOlor = '';

  String incomeCategoryNameText = 'Kategori ismi';
  String expenseCategoryNameText = 'Kategori ismi';

  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController expenseTextEditingController = TextEditingController();

  void goToAddIncomeCategoryPage() {
    emit(AddIncomeCategoryState(
        pickerColor: incomePickerColor,
        incomeTextEditingController: incomeTextEditingController,
        iconIndex: iconIndex,
        incomeCategoryNameText: incomeCategoryNameText));
  }

  void goToAddExpenseCategoryPage() {
    emit(AddExpenseCategoryState(
      pickerColor: expensePickerColor,
      expenseTextEditingController: expenseTextEditingController,
      expenseCategoryNameText: expenseCategoryNameText,
      iconIndex: iconIndex,
    ));
  }

  void changeColorForIncomePage(Color color) {
    incomePickerColor = color;
    emit(AddIncomeCategoryState(
        pickerColor: incomePickerColor,
        incomeTextEditingController: incomeTextEditingController,
        iconIndex: iconIndex,
        incomeCategoryNameText: incomeCategoryNameText));
  }

  void changeColorForExpensePage(Color color) {
    expensePickerColor = color;
    emit(AddExpenseCategoryState(
      pickerColor: expensePickerColor,
      expenseTextEditingController: expenseTextEditingController,
      expenseCategoryNameText: expenseCategoryNameText,
      iconIndex: iconIndex,
    ));
  }

  void changeIncomeText() {
    incomeCategoryNameText = incomeTextEditingController.text;
    emit(AddIncomeCategoryState(
        pickerColor: incomePickerColor,
        incomeTextEditingController: incomeTextEditingController,
        iconIndex: iconIndex,
        incomeCategoryNameText: incomeCategoryNameText));
  }

  void changeExpenseText() {
    expenseCategoryNameText = expenseTextEditingController.text;
    emit(AddExpenseCategoryState(
      pickerColor: expensePickerColor,
      expenseTextEditingController: expenseTextEditingController,
      expenseCategoryNameText: expenseCategoryNameText,
      iconIndex: iconIndex,
    ));
  }

  void changeIncomeIcon(int index) {
    iconIndex = index;
    emit(AddIncomeCategoryState(
        pickerColor: incomePickerColor,
        incomeTextEditingController: incomeTextEditingController,
        iconIndex: iconIndex,
        incomeCategoryNameText: incomeCategoryNameText));
  }

  void changeExpenseIcon(int index) {
    iconIndex = index;
    emit(AddExpenseCategoryState(
      pickerColor: expensePickerColor,
      expenseTextEditingController: expenseTextEditingController,
      expenseCategoryNameText: expenseCategoryNameText,
      iconIndex: iconIndex,
    ));
  }

  Future addIncomeCategoryInToDatabase() async {}

  Future addExpenseCategoryInToDatabase() async {}
}
