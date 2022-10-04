import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String fullName;

  @HiveField(1)
  String email;

  @HiveField(2)
  String companyName;

  @HiveField(3)
  List<CategoryModel> allCategories;

  @HiveField(4)
  List<CustomerModel> allCustomers;

  @HiveField(5)
  List<MovementModel> allMovements;

  UserModel({
    required this.fullName,
    required this.email,
    required this.companyName,
    required this.allCategories,
    required this.allCustomers,
    required this.allMovements,
  });
}
