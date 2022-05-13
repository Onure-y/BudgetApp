import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addCategoryMovementCubit/addCategoryMovement_cubit.dart';
import 'package:budget_app/cubits/addCategoryMovementCubit/addCategoryMovement_state.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/helper/color_converter.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryMovementPage extends StatelessWidget {
  const AddCategoryMovementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          AddCategoryMovementCubit(userRepository: userRepository),
      child: BlocBuilder<AddCategoryMovementCubit, AddCategoryMovementState>(
        builder: (BuildContext thisContext, AddCategoryMovementState state) {
          if (state is AddCategoryMovementLoadingState) {
            return AppLoadingComp();
          }
          if (state is AddCategoryMovementLoadedState) {
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
                            thisContext
                                .read<AppCubit>()
                                .goToChooseMovementTypePage();
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
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConverter.convertColorFromString(
                                      state.category.containerColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        IconHelperPackage.icons[
                                            state.category.categoryIconIndex],
                                        size: 64,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      AutoSizeText(state.category.categoryName,
                                          style: primaryNormalTextStyle,
                                          minFontSize: 16),
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
                                  controller: state.movementTextController,
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
                                  controller: state.movementValueTextController,
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
                                  thisContext
                                      .read<AddCategoryMovementCubit>()
                                      .createNewExpenseCategoryMovement();
                                  context.read<AppCubit>().navigateToPage(0);
                                },
                                child: AutoSizeText(
                                  'Gider Hareketi Ekleyin',
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
                                  thisContext
                                      .read<AddCategoryMovementCubit>()
                                      .createNewIncomeCategoryMovement();
                                  context.read<AppCubit>().navigateToPage(0);
                                  debugPrint(state.category.categoryName);
                                },
                                child: AutoSizeText(
                                  'Gelir Hareketi Ekleyin',
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
          if (state is AddCategoryMovementTemplateState) {
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
                            thisContext
                                .read<AppCubit>()
                                .goToChooseMovementTypePage();
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
                              onTap: () {
                                showDialog(
                                  context: thisContext,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Text(
                                          'Kategori Sec',
                                          style: secondryMediumTextStyle,
                                        ),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Container(
                                          width: 500,
                                          height: 500,
                                          child: GridView.builder(
                                            itemCount: state.categories.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 40,
                                              mainAxisSpacing: 40,
                                            ),
                                            itemBuilder:
                                                (BuildContext newContext,
                                                    int index) {
                                              CategoryModel categoryModel =
                                                  state.categories[index];
                                              return InkWell(
                                                onTap: () async {
                                                  thisContext
                                                      .read<
                                                          AddCategoryMovementCubit>()
                                                      .emitCategory(index);
                                                  Navigator.pop(thisContext);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ColorConverter
                                                        .convertColorFromString(
                                                            categoryModel
                                                                .containerColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          IconHelperPackage
                                                                  .icons[
                                                              categoryModel
                                                                  .categoryIconIndex],
                                                          size: 64,
                                                          color: Colors.white,
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        AutoSizeText(
                                                            categoryModel
                                                                .categoryName,
                                                            style:
                                                                primaryNormalTextStyle,
                                                            minFontSize: 16),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                              ;
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
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
                                  showDialog(
                                    context: thisContext,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          height: 100,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            color: expenseColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.error_outline_rounded,
                                              color: Colors.white,
                                              size: 64,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: 200,
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                AutoSizeText(
                                                  'Hata',
                                                  style: boldTextStyle,
                                                  minFontSize: 24,
                                                  textAlign: TextAlign.center,
                                                ),
                                                AutoSizeText(
                                                  'Lütfen Devam Etmeden Önce Bir Kategori Seçimi Yapınız',
                                                  style:
                                                      secondryNormalTextStyle,
                                                  minFontSize: 14,
                                                  textAlign: TextAlign.center,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: expenseColor,
                                                  ),
                                                  child: AutoSizeText(
                                                    'Tamam',
                                                    style:
                                                        primaryNormalTextStyle,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: AutoSizeText(
                                  'Gider Hareketi Ekleyin',
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
                                  showDialog(
                                    context: thisContext,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          height: 100,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            color: expenseColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.error_outline_rounded,
                                              color: Colors.white,
                                              size: 64,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          width: 200,
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                AutoSizeText(
                                                  'Hata',
                                                  style: boldTextStyle,
                                                  minFontSize: 24,
                                                  textAlign: TextAlign.center,
                                                ),
                                                AutoSizeText(
                                                  'Lütfen Devam Etmeden Önce Bir Kategori Seçimi Yapınız',
                                                  style:
                                                      secondryNormalTextStyle,
                                                  minFontSize: 14,
                                                  textAlign: TextAlign.center,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: expenseColor,
                                                  ),
                                                  child: AutoSizeText(
                                                    'Tamam',
                                                    style:
                                                        primaryNormalTextStyle,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: AutoSizeText(
                                  'Gelir Hareketi Ekleyin',
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
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
