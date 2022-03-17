import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/customerCubit/customer_state.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit({required this.userRepository}) : super(CustomerInitalState()) {
    emit(CustomerLoadingState());
    getUserData();
  }

  final UserRepository userRepository;
  late final UserModel userModel;

  Future getUserData() async {
    userModel = await userRepository.getUserData();
    emit(CustomerLoadedState(userModel: userModel));
  }
}
