import 'package:budget_app/cubits/demoEndCubit/demoEnd_state.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void checkDemoCode() {
    if (demoTextField.text == DEMO_CODE) {
      isDemoCodeCheckedTrue = true;
    } else {
      isDemoCodeCheckedTrue = false;
    }
    emit(DemoEndPageLoadedState(
      demoTextField: demoTextField,
      isDemoCodeCheckedTrue: isDemoCodeCheckedTrue,
    ));
  }
}
