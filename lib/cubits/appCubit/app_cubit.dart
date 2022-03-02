import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit_state.dart';
import 'package:budget_app/views/allMovements_view.dart';
import 'package:budget_app/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    emit(HomePageState());
  }

  void navigateToPage(index) {
    if (index == 0) {
      emit(HomePageState());
    } else if (index == 1) {
      emit(AllMovementPageState());
    } else if (index == 2) {
      emit(OverviewPageState());
    } else if (index == 3) {
      emit(IncomeCategoryPageState());
    } else if (index == 4) {
      emit(ClientPageState());
    } else {
      emit(AppLoading());
    }
  }

  void changeIncomeCategoryPage() {
    emit(IncomeCategoryPageState());
  }

  void changeExpenseCategoryPage() {
    emit(ExpenseCategoryPageState());
  }

  void goToAddIncomeCategoryPage() {
    emit(AddIncomeCategoryPageState());
  }

  void goToAddExpenseCategoryPage() {
    emit(AddExpenseCategoryPageState());
  }

  void goBacktoCategoryPage() {
    emit(IncomeCategoryPageState());
  }
}
