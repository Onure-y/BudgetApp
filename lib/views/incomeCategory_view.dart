import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/cubits/categoryCubit/category_cubit.dart';
import 'package:budget_app/cubits/categoryCubit/category_state.dart';
import 'package:budget_app/helper/color_converter.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';

class IncomeCategoryPage extends StatelessWidget {
  const IncomeCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();

    return BlocProvider(
      create: (context) => CategoryCubit(userRepository: userRepository),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const AppLoadingComp();
          }
          if (state is CategoryLoadedState) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: backgroundColor,
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
                            context
                                .read<AppCubit>()
                                .changeExpenseCategoryPage();
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
                            'Gelir Kategorileri',
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
                                  state.userModel.allCategories.length + 1,
                                  (index) {
                                    if (index ==
                                        state.userModel.allCategories.length) {
                                      return InkWell(
                                        onTap: () {
                                          context
                                              .read<AppCubit>()
                                              .goToAddIncomeCategoryPage();
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
                                                  style:
                                                      secondryNormalTextStyle,
                                                  minFontSize: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      CategoryModel categoryModel =
                                          state.userModel.allCategories[index];
                                      return InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorConverter
                                                .convertColorFromString(
                                                    categoryModel
                                                        .containerColor),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  IconHelperPackage.icons[
                                                      categoryModel
                                                          .categoryIconIndex],
                                                  size: 64,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                AutoSizeText(
                                                    categoryModel.categoryName,
                                                    style:
                                                        primaryNormalTextStyle,
                                                    minFontSize: 16),
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
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
