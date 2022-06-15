import 'package:budget_app/cubits/profileCubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitalState()) {
    emit(ProfileLoadingState());
  }
}
