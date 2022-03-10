import 'package:budget_app/cubits/categoryCubit/category_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.userRepository}) : super(CategoryInitalState()) {
    emit(CategoryLoadingState());
    getUserData();
  }

  late final UserRepository userRepository;
  late final UserModel userModel;

  Future getUserData() async {
    userModel = await userRepository.getUserData();
    emit(CategoryLoadedState(userModel: userModel));
  }
}
