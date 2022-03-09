import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 1)
class CustomerModel extends HiveObject {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String companyName;

  @HiveField(3)
  String telephoneNumber1;

  @HiveField(4)
  String telephoneNumber2;

  @HiveField(5)
  String email;

  @HiveField(6)
  String web;

  @HiveField(7)
  String address;

  @HiveField(8)
  String city;

  @HiveField(9)
  String details;

  @HiveField(10)
  String containerColor;

  @HiveField(11)
  int customerIconIndex;

  CustomerModel({
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.telephoneNumber1,
    required this.telephoneNumber2,
    required this.email,
    required this.web,
    required this.address,
    required this.city,
    required this.details,
    required this.containerColor,
    required this.customerIconIndex,
  });
}
