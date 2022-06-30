import 'package:budget_app/cubits/profileCubit/profile_state.dart';
import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/settingsModel/setting_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.userRepository, required this.settingsRepository})
      : super(ProfileInitalState()) {
    emit(ProfileLoadingState());
    initState();
  }

  final UserRepository userRepository;
  final SettingsRepository settingsRepository;
  String userName = '';
  String companyName = '';
  bool isPremium = false;
  int remainingDay = 0;

  Future initState() async {
    await getUserData();
    await getDemoAndPremiumStatus();
    emit(ProfileLoadedState(
      fullName: userName,
      companyName: companyName,
      isPremium: isPremium,
      remainingDay: remainingDay,
    ));
  }

  Future getUserData() async {
    UserModel userModel = await userRepository.getUserData();
    userName = userModel.firstName + ' ' + userModel.lastName;
    companyName = userModel.companyName;
  }

  Future getDemoAndPremiumStatus() async {
    SettingsModel demoData = await settingsRepository.getDemoData();
    isPremium = demoData.isPremium;
    int demoEndTime = demoData.demoEndTime;
    final currentTime = TimerPackage.getCurrentTime();
    int remainingTime = demoEndTime - currentTime;
    debugPrint(remainingTime.toString());
    remainingDay = (remainingTime ~/ 86400000);
  }
}
