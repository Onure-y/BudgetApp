import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'movement_model.g.dart';

enum CategoryOrCustomer { category, customer }

@HiveType(typeId: 3)
class MovementModel extends HiveObject {
  @HiveField(0)
  String movementText;

  @HiveField(1)
  double movementValue;

  @HiveField(2)
  int time;

  @HiveField(3)
  late CategoryModel category;

  @HiveField(4)
  late CustomerModel customer;

  @HiveField(5)
  bool isCategoryMovement;

  MovementModel({
    required this.movementText,
    required this.movementValue,
    required this.time,
    required this.isCategoryMovement,
  });

  void updateCategory(
      CategoryModel categoryModel, CustomerModel emptyCustomerModel) {
    category = categoryModel;
    customer = emptyCustomerModel;
  }

  void updateCustomer(
      CustomerModel customerModel, CategoryModel emptyCategoryModel) {
    customer = customerModel;
    category = emptyCategoryModel;
  }
}
