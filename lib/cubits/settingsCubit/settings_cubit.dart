import 'package:budget_app/cubits/settingsCubit/settings_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required this.userRepository}) : super(SettingsInitalState()) {
    emit(SettingsLoadingState());
    initState();
  }
  final UserRepository userRepository;
  late UserModel userModel;

  Future getDataFromDatabase() async {
    userModel = await userRepository.getUserData();
    emit(SettingsLoadedState(userModel: userModel));
  }

  Future initState() async {
    await getDataFromDatabase();
  }

  Future createUser() async {
    // await userRepository.createUser();
    await getDataFromDatabase();
    emit(SettingsLoadedState(userModel: userModel));
  }

  Future deleteUser() async {
    await userRepository.deleteUserFromDatabase();
    await getDataFromDatabase();
  }

  Future createIncomeMovement() async {
    // await userRepository.createMovementWithCategory();
    await getDataFromDatabase();
  }

  Future deleteAllMovements() async {
    await userRepository.clearAllMovements();
  }
}
