import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/userCubit/user_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userRepository}) : super(UserInitialState()) {
    emit(UserLoadingState());
    checkUserState();
  }

  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController companyNameTextController =
      TextEditingController();

  final UserRepository userRepository;

  Future checkUserState() async {
    UserModel userData = await userRepository.getUserData();
    if (userData.firstName == '') {
      emit(
        UserNotExistState(
          firstNameTextController: firstNameTextController,
          lastNameTextController: lastNameTextController,
          companyNameTextController: companyNameTextController,
        ),
      );
    } else {
      emit(UserExistState());
    }
  }

  Future createUser() async {
    await userRepository.createUser(
        firstName: firstNameTextController.text,
        lastNme: lastNameTextController.text,
        companyName: companyNameTextController.text);

    emit(UserExistState());
  }

  Future signOut() async {
    emit(
      UserNotExistState(
        firstNameTextController: firstNameTextController,
        lastNameTextController: lastNameTextController,
        companyNameTextController: companyNameTextController,
      ),
    );
  }
}
