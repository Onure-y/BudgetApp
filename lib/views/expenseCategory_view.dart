import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';

class ExpenseCategoryPage extends StatelessWidget {
  const ExpenseCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 75,
            width: double.infinity,
            color: lightColor,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read<AppCubit>().changeIncomeCategoryPage();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    height: double.infinity,
                    width: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        'Gelir',
                        minFontSize: 36,
                        style: secondryMediumTextStyle,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<AppCubit>().changeExpenseCategoryPage();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    height: double.infinity,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        'Gider',
                        minFontSize: 36,
                        style: secondryMediumTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Gider Kategorileri',
                    style: secondryMediumTextStyle,
                    minFontSize: 24,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Flexible(
                    child: Container(
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 70,
                          childAspectRatio: 1,
                        ),
                        children: List.generate(
                          1,
                          (index) {
                            if (index == 0) {
                              return InkWell(
                                onTap: () {
                                  context
                                      .read<AppCubit>()
                                      .goToAddExpenseCategoryPage();
                                },
                                child: DottedBorder(
                                  color: Colors.black,
                                  strokeWidth: 1,
                                  dashPattern: const [5, 5],
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(20.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DottedBorder(
                                          child: const Icon(
                                            Icons.add,
                                            size: 64,
                                          ),
                                          strokeWidth: 1,
                                          dashPattern: const [5, 5],
                                          borderType: BorderType.Circle,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText(
                                          'Kategori Ekle',
                                          style: secondryNormalTextStyle,
                                          minFontSize: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: incomeColor,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.maps_home_work_outlined,
                                          size: 64,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText(
                                          'Sirket Gelirleri',
                                          style: primaryNormalTextStyle,
                                          minFontSize: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
