import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategoryCubi_state.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategory_cubit.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddIncomeCategoryPage extends StatelessWidget {
  const AddIncomeCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: BlocBuilder<AddCategoryCubit, AddCategoryState>(
      builder: (BuildContext context, AddCategoryState state) {
        if (state is AddCategoryStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AddIncomeCategoryState) {
          return Column(
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
                        context.read<AppCubit>().goBacktoCategoryPage();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 32,
                      ),
                      label: AutoSizeText(
                        'Gelir Kategorisi Ekle',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: state.pickerColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 64,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AutoSizeText('Kategori Ismi',
                                style: primaryNormalTextStyle, minFontSize: 24),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                          child: ColorPicker(
                                              pickerColor: state.pickerColor,
                                              onColorChanged: (Color color) {
                                                context
                                                    .read<AddCategoryCubit>()
                                                    .changeColor(color);
                                              })),
                                    );
                                  });
                            },
                            child: AutoSizeText(
                              'Renk Degistir',
                              style: secondryNormalTextStyle,
                              minFontSize: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(15.0),
                              primary: buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              'Icon Degistir',
                              style: secondryNormalTextStyle,
                              minFontSize: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(15.0),
                              primary: buttonColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: 'Kategori ismi',
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
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
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
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
