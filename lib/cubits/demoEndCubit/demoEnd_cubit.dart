import 'dart:convert';
import 'package:budget_app/cubits/demoEndCubit/demoEnd_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class DemoEndTimeCubit extends Cubit<DemoEndPageState> {
  DemoEndTimeCubit({
    required this.userRepository,
    required this.settingsRepository,
  }) : super(DemoEndPageInitalState()) {
    emit(DemoEndPageLoadingState());
    emit(DemoEndPageLoadedState(
      demoTextField: demoTextField,
      isDemoCodeCheckedTrue: isDemoCodeCheckedTrue,
    ));
  }

  final UserRepository userRepository;
  final SettingsRepository settingsRepository;
  final TextEditingController demoTextField = TextEditingController();
  bool isDemoCodeCheckedTrue = false;

  Future checkDemoCode() async {
    final userDemoCode = await fecthUserDemoCode();
    if (userDemoCode.toString() == demoTextField.text) {
      emit(DemoEndPageLoadedState(
        demoTextField: demoTextField,
        isDemoCodeCheckedTrue: true,
      ));
      return true;
    } else {
      isDemoCodeCheckedTrue = false;
      return false;
    }
  }

  Future fecthUserDemoCode() async {
    UserModel userModel = await userRepository.getUserData();
    String userEmail = userModel.email;
    final response = await http.get(
      Uri.parse(
          'https://noveria-software-website.herokuapp.com/api/v1/forms/$userEmail'),
    );

    if (response.statusCode == 200) {
      var clientDemoCode = jsonDecode(response.body);
      return clientDemoCode.toString();
    } else {
      // this code block will be added in future updates
    }
  }
}
