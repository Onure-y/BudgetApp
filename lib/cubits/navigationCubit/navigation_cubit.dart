import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/navigationCubit/navigation_cubit_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial()) {
    emit(NavigationLoaded(onTapState));
  }

  List<bool> onTapState = [true, false, false, false, false, false];

  void changePage(index) {
    onTapState = [false, false, false, false, false, false];
    onTapState[index] = true;
    emit(NavigationLoaded(onTapState));
  }
}
