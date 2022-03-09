import 'package:flutter/material.dart';

class IconHelperPackage {
  static List<IconData> icons = [
    Icons.people,
    Icons.account_box,
    Icons.add_call,
    Icons.add_business,
    Icons.create_rounded,
    Icons.house_rounded,
    Icons.work_rounded,
    Icons.car_repair_rounded,
    Icons.person_rounded,
    Icons.weekend_rounded,
    Icons.add_shopping_cart_rounded,
    Icons.business_center_rounded,
    Icons.business_rounded,
    Icons.point_of_sale_rounded,
    Icons.fastfood_rounded,
    Icons.restaurant_menu_rounded,
    Icons.shopping_cart_rounded,
    Icons.time_to_leave_rounded,
    Icons.widgets_rounded,
    Icons.view_column_rounded,
  ];

  static IconData getIcon(int iconIndex) {
    IconData selectedIcon = icons[iconIndex];
    return selectedIcon;
  }
}
