import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/userCubit/user_state.dart';
import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/settingsModel/setting_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.userRepository,
    required this.settingsRepository,
  }) : super(UserInitialState()) {
    emit(UserLoadingState());
    checkDemoState();
    checkUserState();
  }

  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController companyNameTextController =
      TextEditingController();

  final UserRepository userRepository;
  final SettingsRepository settingsRepository;

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

  Future checkDemoState() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      SettingsModel settingsData = await settingsRepository.getDemoData();
      bool isDemoTimeEnded = checkEstimatedTime(
        settingsData.demoEndTime,
        TimerPackage.getCurrentTime(),
      );
      if (isDemoTimeEnded) {
        debugPrint('Demo time ended');
        emit(UserDemoTimeEnded());
      }
    });
  }

  bool checkEstimatedTime(int demoEndTime, int currentTime) {
    debugPrint('demoEndTime == $demoEndTime');
    debugPrint('currentTime == $currentTime');
    if (demoEndTime < currentTime && demoEndTime != 0) {
      debugPrint('aaaa');
      return true;
    } else {
      debugPrint('bbbb');
      return false;
    }
  }

  Future createUser() async {
    await userRepository.createUser(
      firstName: firstNameTextController.text,
      lastNme: lastNameTextController.text,
      companyName: companyNameTextController.text,
    );

    await settingsRepository.createEstimatedTime();
    debugPrint('Demo Estimated Time created');

    emit(UserExistState());
  }

  Future signOut() async {
    await settingsRepository.resetData();
    emit(
      UserNotExistState(
        firstNameTextController: firstNameTextController,
        lastNameTextController: lastNameTextController,
        companyNameTextController: companyNameTextController,
      ),
    );
  }

  Future setUserPremium() async {
    await settingsRepository.setUserPremium();
    emit(UserExistState());
  }
}
