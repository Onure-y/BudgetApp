import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/userInfoCubit/userInfo_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit({required this.userRepository})
      : super(UserInfoInitialState()) {
    emit(UserInfoLoadingState());
    getUserData();
  }

  late UserModel userData;

  final UserRepository userRepository;

  Future getUserData() async {
    userData = await userRepository.getUserData();
    emit(UserInfoLoadedState(userModel: userData));
  }
}
