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
    emit(DemoEndPageLoadedState(demoTextField: demoTextField));
  }

  final UserRepository userRepository;
  final SettingsRepository settingsRepository;
  final TextEditingController demoTextField = TextEditingController();

  final String DEMO_CODE = "132456";
}
