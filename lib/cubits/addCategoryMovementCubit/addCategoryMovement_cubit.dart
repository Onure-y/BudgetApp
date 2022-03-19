import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/addCategoryMovementCubit/addCategoryMovement_state.dart';
import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class AddCategoryMovementCubit extends Cubit<AddCategoryMovementState> {
  AddCategoryMovementCubit({required this.userRepository})
      : super(AddCategoryMovementInitalState()) {
    emit(AddCategoryMovementLoadingState());
    getUserCategories();
  }

  final UserRepository userRepository;
  final TextEditingController movementTextController = TextEditingController();
  final TextEditingController movementValueTextController =
      TextEditingController();

  late List<CategoryModel> categories;
  late CategoryModel selectedCategory;

  Future getUserCategories() async {
    UserModel userData = await userRepository.getUserData();
    List<CategoryModel> categoriesData = [];
    for (var i = 0; i < userData.allCategories.length; i++) {
      categoriesData.add(userData.allCategories[i]);
    }
    categories = categoriesData;
    emit(
      AddCategoryMovementTemplateState(
        movementValueTextController: movementValueTextController,
        movementTextController: movementTextController,
        categories: categories,
      ),
    );
  }

  void emitCategory(int index) {
    selectedCategory = categories[index];
    emit(AddCategoryMovementLoadedState(
      movementValueTextController: movementValueTextController,
      movementTextController: movementTextController,
      categories: categories,
      category: selectedCategory,
    ));
  }

  Future createNewCategoryMovement() async {
    await userRepository.createMovementWithCategory(
      movementText: movementTextController.text,
      movementValue: double.parse(movementValueTextController.text),
      time: TimerPackage.getCurrentTime(),
      categoryModel: selectedCategory,
    );
  }
}
