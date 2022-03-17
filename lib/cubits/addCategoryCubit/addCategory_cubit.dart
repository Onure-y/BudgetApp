import 'package:bloc/bloc.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategory_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit({required this.userRepository})
      : super(AddCategoryStateInitial()) {
    emit(AddCategoryStateLoading());
  }
  final UserRepository userRepository;

  int iconIndex = 8;

  String incomePickerStringColor = '4F75FE';
  String expensePickerStringCOlor = 'FD635C';

  String incomeCategoryNameText = 'Kategori ismi';
  String expenseCategoryNameText = 'Kategori ismi';

  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController expenseTextEditingController = TextEditingController();

  void goToAddIncomeCategoryPage() {
    emit(AddIncomeCategoryState(
      pickerColor: incomePickerStringColor,
      incomeTextEditingController: incomeTextEditingController,
      iconIndex: iconIndex,
      incomeCategoryNameText: incomeCategoryNameText,
    ));
  }

  Future goToEditCategoryPage(int index) async {
    UserModel userModel = await userRepository.getUserData();
    emit(EditCategoryState(
      pickerColor: incomePickerStringColor,
      incomeTextEditingController: incomeTextEditingController,
      iconIndex: iconIndex,
      incomeCategoryNameText: incomeCategoryNameText,
      categoryModel: userModel.allCategories[index],
    ));
  }

  void changeColorForIncomePage(String stringColor) {
    incomePickerStringColor = stringColor;
    emit(AddIncomeCategoryState(
      pickerColor: incomePickerStringColor,
      incomeTextEditingController: incomeTextEditingController,
      iconIndex: iconIndex,
      incomeCategoryNameText: incomeCategoryNameText,
    ));
  }

  void changeIncomeText() {
    incomeCategoryNameText = incomeTextEditingController.text;
    emit(AddIncomeCategoryState(
      pickerColor: incomePickerStringColor,
      incomeTextEditingController: incomeTextEditingController,
      iconIndex: iconIndex,
      incomeCategoryNameText: incomeCategoryNameText,
    ));
  }

  void changeIncomeIcon(int index) {
    iconIndex = index;
    emit(AddIncomeCategoryState(
      pickerColor: incomePickerStringColor,
      incomeTextEditingController: incomeTextEditingController,
      iconIndex: iconIndex,
      incomeCategoryNameText: incomeCategoryNameText,
    ));
  }

  Future addIncomeCategoryInToDatabase() async {
    String categoryName = incomeTextEditingController.text;
    String containerColor = incomePickerStringColor;
    int categoryIconIndex = iconIndex;
    await userRepository.createNewCategory(
      categoryName: categoryName,
      containerColor: containerColor,
      categoryIconIndex: categoryIconIndex,
    );
  }

  Future deleteCategoryFromDatabase(int index) async {
    await userRepository.deleteCategory(index);
  }
}
