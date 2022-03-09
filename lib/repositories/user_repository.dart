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

  Future createMovementWithCustomer() async {
    MovementModel templateMovementModel = MovementModel(
      movementText: 'Rise Software',
      movementValue: 12500,
      time: getCurrentTime(),
      isCategoryMovement: false,
    )..updateCustomer(
        CustomerModel(
          address: 'kyk',
          city: 'konya',
          companyName: 'Spacex',
          firstName: 'Elon',
          lastName: 'Musk',
          containerColor: 'FD635C',
          customerIconIndex: 0,
          details: 'ascasdac',
          email: 'asdac',
          telephoneNumber1: 'aac',
          telephoneNumber2: 'ascas',
          web: 'ascasc',
        ),
        emptyCategoryModel);
  }

  Future createMovementWithCategory() async {
    UserModel userModel = await getUserData();
    MovementModel templateMovementModel = MovementModel(
      movementText: 'Rise Software',
      movementValue: 12500,
      time: getCurrentTime(),
      isCategoryMovement: true,
    )..updateCategory(
        CategoryModel(
          categoryIconIndex: 0,
          categoryName: 'Malzeme',
          containerColor: '2A2438',
        ),
        emptyCustomerModel,
      );
    userModel.allMovements.add(templateMovementModel);
    userBox.put(userDataKey, userModel);
  }

  Future createUser() async {
    UserModel createdUserData = UserModel(
      firstName: 'Onur Emre',
      lastName: 'YILDIRIM',
      companyName: 'Rise Software',
      allCategories: [
        /*       CategoryModel(
          categoryIcon: Icon(Icons.home_filled),
          categoryName: 'Malzeme',
          containerColor: '2A2438',
        ) */
      ],
      allCustomers: [
        /* CustomerModel(
          address: '',
          city: '',
          companyName: 'Rise Software',
          firstName: 'Ensar Aydin',
          lastName: 'Aydin',
          containerColor: '2A2438',
          customerIcon: const Icon(Icons.person),
          details: '',
          email: '',
          telephoneNumber1: '',
          telephoneNumber2: '',
          web: '',
        ), */
      ],
      allMovements: [
        MovementModel(
          movementText: 'Rise Software',
          movementValue: 12500,
          time: getCurrentTime(),
          isCategoryMovement: true,
        )..updateCategory(
            CategoryModel(
              categoryIconIndex: 0,
              categoryName: 'Malzeme',
              containerColor: '2A2438',
            ),
            emptyCustomerModel),
        /*   MovementModel(
          movementText: 'Rise Software',
          movementValue: 12.500,
          time: getCurrentTime() + 50,
        ),
        MovementModel(
          movementText: 'Rise Software',
          movementValue: 12.500,
          time: getCurrentTime() + 100,
        ), */
      ],
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

  Future deleteUserFromDatabase() async {
    userBox.delete(userDataKey);
  }
}
