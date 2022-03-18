import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryMovementPage extends StatelessWidget {
  const AddCategoryMovementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            height: 75,
            width: double.infinity,
            color: lightColor,
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<AppCubit>().goToChooseMovementTypePage();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 32,
                  ),
                  label: AutoSizeText(
                    'Kategori Hareketi Ekleyin',
                    minFontSize: 36,
                    style: secondryMediumTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    child: InkWell(
                      onTap: () {},
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        dashPattern: const [5, 5],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 250,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: 'Hareket Ismi',
                            labelStyle: secondryNormalTextStyle,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        width: 250,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: 'Hareket Tutari',
                            labelStyle: secondryNormalTextStyle,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<AppCubit>().navigateToPage(0);
                        },
                        child: AutoSizeText(
                          'Iptal Et',
                          style: primaryNormalTextStyle,
                          minFontSize: 18,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: expenseColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          minimumSize: const Size(150, 50),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: AutoSizeText(
                          'Kategori Ekle',
                          style: primaryNormalTextStyle,
                          minFontSize: 18,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: incomeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          minimumSize: const Size(150, 50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
