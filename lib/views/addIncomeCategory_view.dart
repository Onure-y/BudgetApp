import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategory_state.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategory_cubit.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddIncomeCategoryPage extends StatelessWidget {
  const AddIncomeCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    return BlocProvider(
      create: (context) => AddCategoryCubit(userRepository: userRepository)
        ..goToAddIncomeCategoryPage(),
      child: Container(child: BlocBuilder<AddCategoryCubit, AddCategoryState>(
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
                            color: Color(int.parse('0xff' + state.pickerColor)),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconHelperPackage.icons[state.iconIndex],
                                  size: 48, color: Colors.white),
                              const SizedBox(
                                height: 10,
                              ),
                              AutoSizeText(
                                state.incomeCategoryNameText,
                                style: primaryNormalTextStyle,
                                minFontSize: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Builder(builder: (BuildContext newContext) {
                              return ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Renk Sec!'),
                                          content: SingleChildScrollView(
                                            child: ColorPicker(
                                              pickerColor: Color(int.parse(
                                                  '0xff' + state.pickerColor)),
                                              onColorChanged: (Color color) {
                                                String myStringColor = color
                                                    .value
                                                    .toRadixString(16)
                                                    .substring(2, 8);
                                                debugPrint(myStringColor);
                                                newContext
                                                    .read<AddCategoryCubit>()
                                                    .changeColorForIncomePage(
                                                        myStringColor);
                                              },
                                            ),
                                          ),
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
                              );
                            }),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Builder(
                              builder: (newContext) {
                                return ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Center(
                                              child: Text('Icon sec')),
                                          content: Container(
                                            width: 500,
                                            height: 500,
                                            child: GridView.builder(
                                              itemCount: IconHelperPackage
                                                  .icons.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                              ),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    newContext
                                                        .read<
                                                            AddCategoryCubit>()
                                                        .changeIncomeIcon(
                                                            index);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(IconHelperPackage
                                                      .icons[index]),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: AutoSizeText(
                                    'Icon Degistir',
                                    style: secondryNormalTextStyle,
                                    minFontSize: 18,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    primary: buttonColor,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              child: TextFormField(
                                controller: state.incomeTextEditingController,
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
                              width: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<AddCategoryCubit>()
                                    .changeIncomeText();
                              },
                              child:
                                  const Icon(Icons.check, color: balanceColor),
                              style: ElevatedButton.styleFrom(
                                primary: buttonColor,
                                minimumSize: const Size(50, 50),
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )
                          ],
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
                              onPressed: () {
                                context
                                    .read<AddCategoryCubit>()
                                    .addIncomeCategoryInToDatabase();
                                context
                                    .read<AppCubit>()
                                    .changeIncomeCategoryPage();
                              },
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
      )),
    );
  }
}
