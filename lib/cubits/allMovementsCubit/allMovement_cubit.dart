import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/allMovementsCubit/allMovement_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';

class AllMovementCubit extends Cubit<AllMovementsState> {
  AllMovementCubit({required this.userRepository})
      : super(AllMovementsInitalState()) {
    emit(AllMovementsLoadingState());
    initState();
  }

  late UserModel userModel;
  final UserRepository userRepository;

  Future getUserData() async {
    emit(AllMovementsLoadingState());
    userModel = await userRepository.getUserData();
    emit(AllMovementsLoadedState(userModel: userModel));
  }

  Future initState() async {
    await getUserData();
  }
}
