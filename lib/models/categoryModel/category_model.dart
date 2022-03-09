import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String categoryName;

  @HiveField(1)
  String containerColor;

  @HiveField(2)
  int categoryIconIndex;

  CategoryModel({
    required this.categoryName,
    required this.containerColor,
    required this.categoryIconIndex,
  });
}
