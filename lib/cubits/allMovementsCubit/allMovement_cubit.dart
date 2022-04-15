import 'package:bloc/bloc.dart';
import 'package:budget_app/cubits/allMovementsCubit/allMovement_state.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class AllMovementCubit extends Cubit<AllMovementsState> {
  AllMovementCubit({required this.userRepository})
      : super(AllMovementsInitalState()) {
    emit(AllMovementsLoadingState());
    initState();
  }

  final UserRepository userRepository;
  final ScrollController scrollController = ScrollController();
  List<CategoryModel> allCategories = [];
  List<CustomerModel> allCustomers = [];
  List<MovementModel> movements = [];

  final TextEditingController sarchTextEditingController =
      TextEditingController();

  Future initState() async {
    await getAllMovements();
    await getUserCategories();
    await getUserCustomers();
    emitPage();
  }

  void emitPage() async {
    emit(
      AllMovementsLoadedState(
        allCategories: allCategories,
        allCustomers: allCustomers,
        scrollController: scrollController,
        movements: movements,
        sarchTextEditingController: sarchTextEditingController,
      ),
    );
  }

  Future<List<MovementModel>> getMovementsData() async {
    emit(AllMovementsLoadingState());
    UserModel userModel = await userRepository.getUserData();
    List<MovementModel> allMovements = userModel.allMovements;
    return allMovements;
  }

  Future getUserCategories() async {
    UserModel userModel = await userRepository.getUserData();
    allCategories = userModel.allCategories;
  }

  Future getUserCustomers() async {
    UserModel userModel = await userRepository.getUserData();
    allCustomers = userModel.allCustomers;
  }

  Future getAllMovements() async {
    movements = await getMovementsData();
  }

  Future getSelectedCategoryMovements(String categoryName) async {
    List<MovementModel> allMovements = await getMovementsData();
    List<MovementModel> selectedCategoryList = [];
    for (MovementModel movement in allMovements) {
      if (movement.category.categoryName == categoryName) {
        selectedCategoryList.add(movement);
      }
    }
    movements = selectedCategoryList;
    emitPage();
  }

  Future getSelectedCustomerMovements(String customerName) async {
    List<MovementModel> allMovements = await getMovementsData();
    List<MovementModel> selectedCustomerList = [];
    for (MovementModel movement in allMovements) {
      if (movement.customer.firstName == customerName) {
        selectedCustomerList.add(movement);
      }
    }
    movements = selectedCustomerList;
    emitPage();
  }

  Future sortByHigherOrder() async {
    List<MovementModel> allMovements = await getMovementsData();
    List<MovementModel> sortList = [];
    for (MovementModel movement in allMovements) {
      sortList.add(movement);
    }
    sortList.sort((a, b) => a.movementValue.compareTo(b.movementValue));
    movements = sortList;
    emitPage();
  }

  Future sortByLowerOrder() async {
    List<MovementModel> allMovements = await getMovementsData();
    List<MovementModel> sortList = [];
    for (MovementModel movement in allMovements) {
      sortList.add(movement);
    }
    sortList.sort((a, b) => b.movementValue.compareTo(a.movementValue));
    movements = sortList;
    emitPage();
  }

  Future sortByHigherTime() async {
    List<MovementModel> allMovements = await getMovementsData();
    List<MovementModel> sortList = [];
    for (MovementModel movement in allMovements) {
      sortList.add(movement);
    }
    sortList.sort((a, b) => a.time.compareTo(b.time));
    movements = sortList;
    emitPage();
  }

  Future sortByLowerTime() async {
    List<MovementModel> allMovements = await getMovementsData();
    List<MovementModel> sortList = [];
    for (MovementModel movement in allMovements) {
      sortList.add(movement);
    }
    sortList.sort((a, b) => b.time.compareTo(a.time));
    movements = sortList;
    emitPage();
  }

  Future searchForMovement(String searchString) async {
    List<MovementModel> allMovements = await getMovementsData();
    List<MovementModel> referanceList = [];
    List<MovementModel> searchList = [];
    // String searchText = sarchTextEditingController.text;
    for (MovementModel movement in allMovements) {
      referanceList.add(movement);
    }
    for (MovementModel movement in allMovements) {
      if (movement.movementText.toLowerCase().contains(searchString)) {
        searchList.add(movement);
        debugPrint(movement.movementText);
      }
    }
    movements = searchList;
    emitPage();
  }

  Future deleteMovement(MovementModel movement) async {
    await userRepository.deleteMovement(movement);
    await initState();
  }
}
