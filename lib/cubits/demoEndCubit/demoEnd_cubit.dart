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

  // ignore: non_constant_identifier_names
  final String DEMO_CODE = "OEY4255";

  /*  void checkDemoCode() {
    if (demoTextField.text == DEMO_CODE) {
      isDemoCodeCheckedTrue = true;
    } else {
      isDemoCodeCheckedTrue = false;
    }
    emit(DemoEndPageLoadedState(
      demoTextField: demoTextField,
      isDemoCodeCheckedTrue: isDemoCodeCheckedTrue,
    ));
  } */

  Future checkDemoCode() async {
    final userDemoCode = await fecthUserDemoCode();
    if (userDemoCode.toString() == demoTextField.text) {
      isDemoCodeCheckedTrue = true;
      return true;
    } else {
      isDemoCodeCheckedTrue = false;
    }
    emit(DemoEndPageLoadedState(
      demoTextField: demoTextField,
      isDemoCodeCheckedTrue: isDemoCodeCheckedTrue,
    ));
  }

  Future fecthUserDemoCode() async {
    UserModel userModel = await userRepository.getUserData();
    String userFullName = "${userModel.firstName} ${userModel.lastName}";
    debugPrint(userFullName);
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/v1/forms/$userFullName'),
    );

    if (response.statusCode == 200) {
      var clientDemoCode = jsonDecode(response.body);
      // debugPrint(clientDemoCode.toString());
      return clientDemoCode.toString();
    } else {
      // this code block will be added in future updates
    }
  }
}
