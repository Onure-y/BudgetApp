import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/homePageCubit/homePage_state.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.userRepository})
      : super(HomePageInitialState()) {
    emit(HomePageLoadingState());
    initState();
  }

  late UserModel userModel;
  final UserRepository userRepository;

  Future getUserData() async {
    emit(HomePageLoadingState());
    userModel = await userRepository.getUserData();
    emit(HomePageLoadedState(userModel: userModel));
  }

  Future initState() async {
    await getUserData();
  }

  Future getIncomeValue() async {
    UserModel userModel = await userRepository.getUserData();
    List<MovementModel> allMovementsData = userModel.allMovements;
  }
}
