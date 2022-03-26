import 'package:budget_app/constant.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepository {
  final Box<UserModel> userBox;

  UserRepository({required this.userBox});
  String userDataKey = 'userData';

  UserModel emptyUserData = UserModel(
    firstName: '',
    lastName: '',
    companyName: '',
    allCategories: [],
    allCustomers: [],
    allMovements: [],
  );

  CategoryModel emptyCategoryModel = CategoryModel(
    categoryIconIndex: 0,
    categoryName: '',
    containerColor: '',
  );

  CustomerModel emptyCustomerModel = CustomerModel(
    address: '',
    city: '',
    companyName: '',
    firstName: '',
    lastName: '',
    containerColor: '',
    customerIconIndex: 0,
    details: '',
    email: '',
    telephoneNumber1: '',
    telephoneNumber2: '',
    web: '',
  );
  Future<UserModel> getUserData() async {
    UserModel userData = userBox.get(userDataKey) ?? emptyUserData;
    return userData;
  }

  int getCurrentTime() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    return timestamp;
  }

  Future createMovementWithCategory({
    required String movementText,
    required double movementValue,
    required int time,
    required CategoryModel categoryModel,
  }) async {
    UserModel userModel = await getUserData();
    MovementModel templateMovementModel = MovementModel(
      movementText: movementText,
      movementValue: movementValue,
      time: time,
      isCategoryMovement: true,
    )..updateCategory(
        categoryModel,
        emptyCustomerModel,
      );
    userModel.allMovements.add(templateMovementModel);
    userBox.put(userDataKey, userModel);
  }

  Future createMovementWithCustomer(
      {required String movementText,
      required double movementValue,
      required int time,
      required CustomerModel customerModel}) async {
    UserModel userModel = await getUserData();
    MovementModel templateMovementModel = MovementModel(
      movementText: movementText,
      movementValue: movementValue,
      time: time,
      isCategoryMovement: false,
    )..updateCustomer(
        customerModel,
        emptyCategoryModel,
      );
    userModel.allMovements.add(templateMovementModel);
    userBox.put(userDataKey, userModel);
  }

  Future createUser({
    required String firstName,
    required String lastNme,
    required String companyName,
  }) async {
    UserModel createdUserData = UserModel(
      firstName: firstName,
      lastName: lastNme,
      companyName: companyName,
      allCategories: [],
      allCustomers: [],
      allMovements: [],
    );
    userBox.put(userDataKey, createdUserData);
  }

  Future createNewCategory({
    required String categoryName,
    required String containerColor,
    required int categoryIconIndex,
  }) async {
    UserModel userModel = await getUserData();
    CategoryModel newCategory = CategoryModel(
      categoryName: categoryName,
      containerColor: containerColor,
      categoryIconIndex: categoryIconIndex,
    );
    userModel.allCategories.add(newCategory);
    userBox.put(userDataKey, userModel);
  }

  Future createTestIncomeMovement() async {
    UserModel userModel = await getUserData();
    int forwardTime = DateTime.utc(2022, 3, 27).millisecondsSinceEpoch;
    await createMovementWithCategory(
        categoryModel: userModel.allCategories[0],
        movementText: 'aaaa',
        movementValue: 200,
        time: forwardTime);
  }

  Future createNewClient({required CustomerModel customerModel}) async {
    UserModel userModel = await getUserData();
    userModel.allCustomers.add(customerModel);
    userBox.put(userDataKey, userModel);
  }

  Future deleteCategory(int index) async {
    UserModel userData = await getUserData();
    userData.allCategories.removeAt(index);
    userBox.put(userDataKey, userData);
  }

  Future clearAllMovements() async {
    UserModel userData = await getUserData();
    userData.allMovements.clear();
    userBox.put(userDataKey, userData);
  }

  Future deleteClient(int index) async {
    UserModel userData = await getUserData();
    userData.allCustomers.removeAt(index);
    userBox.put(userDataKey, userData);
  }

  Future deleteUserFromDatabase() async {
    userBox.delete(userDataKey);
  }
}
