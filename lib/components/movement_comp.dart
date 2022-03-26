import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:flutter/material.dart';

class MovementComp extends StatelessWidget {
  const MovementComp({
    Key? key,
    required this.icon,
    required this.movementName,
    required this.dateTime,
    required this.movementCategoryColor,
    required this.movementCategoryName,
    required this.movementValue,
  }) : super(key: key);

  final Icon icon;
  final String movementName;
  final String dateTime;
  final Color movementCategoryColor;
  final String movementCategoryName;
  final String movementValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 5,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      icon,
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            movementName,
                            style: secondryNormalTextStyle,
                            minFontSize: 22,
                          ),
                          AutoSizeText(
                            dateTime,
                            style: semiThinNormalTextStyle,
                            minFontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: movementCategoryColor,
                        radius: 10,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      AutoSizeText(
                        movementCategoryName,
                        style: secondryNormalTextStyle,
                        minFontSize: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: AutoSizeText(
            '$movementValue TL',
            style: secondryMediumTextStyle,
            minFontSize: 24,
          ),
        ),
      ],
    );
  }
}
