import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/addCustomerMovementCubit/addCustomerMovement_state.dart';
import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class AddCustomerMovementCubit extends Cubit<AddCustomerMovementState> {
  AddCustomerMovementCubit({required this.userRepository})
      : super(AddCustomerMovementInitalState()) {
    emit(AddCustomerMovementLoadingState());
    getUserCustomers();
  }

  final UserRepository userRepository;
  final TextEditingController movementTextController = TextEditingController();
  final TextEditingController movementValueTextController =
      TextEditingController();

  late CustomerModel selectedCustomer;

  Future getUserCustomers() async {
    UserModel userData = await userRepository.getUserData();
    List<CustomerModel> customers = userData.allCustomers;

    emit(
      AddCustomerMovementTemplateState(
        movementTextController: movementTextController,
        movementValueController: movementValueTextController,
        customers: customers,
      ),
    );
  }

  void emitCustomer(CustomerModel customerModel) {
    selectedCustomer = customerModel;
    emit(AddCustomerMovementLoadedState(
      movementTextController: movementTextController,
      movementValueController: movementValueTextController,
      customer: selectedCustomer,
    ));
  }

  Future createNewCustomerMovement() async {
    await userRepository.createMovementWithCustomer(
      movementText: movementTextController.text,
      movementValue: double.parse(movementValueTextController.text),
      time: TimerPackage.getCurrentTime(),
      customerModel: selectedCustomer,
    );
  }
}
