import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategory_state.dart';
import 'package:budget_app/cubits/addCategoryCubit/addCategory_cubit.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CategoryEditPage extends StatelessWidget {
  const CategoryEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    int index = context.read<AppCubit>().categoryIndex;
    return BlocProvider(
      create: (context) => AddCategoryCubit(userRepository: userRepository)
        ..goToEditCategoryPage(index),
      child: Container(child: BlocBuilder<AddCategoryCubit, AddCategoryState>(
        builder: (BuildContext context, AddCategoryState state) {
          if (state is AddCategoryStateLoading) {
            return const AppLoadingComp();
          }
          if (state is EditCategoryState) {
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
                          'Kategori Duzenle',
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
                            color: Color(int.parse(
                                '0xff' + state.categoryModel.containerColor)),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  IconHelperPackage.icons[
                                      state.categoryModel.categoryIconIndex],
                                  size: 48,
                                  color: Colors.white),
                              const SizedBox(
                                height: 10,
                              ),
                              AutoSizeText(
                                state.categoryModel.categoryName,
                                style: primaryNormalTextStyle,
                                minFontSize: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {
                            //     context.read<AppCubit>().goBacktoCategoryPage();
                            //   },
                            //   child: AutoSizeText(
                            //     'Iptal Et',
                            //     style: primaryNormalTextStyle,
                            //     minFontSize: 18,
                            //   ),
                            //   style: ElevatedButton.styleFrom(
                            //     primary: expenseColor,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(20.0),
                            //     ),
                            //     minimumSize: const Size(150, 50),
                            //   ),
                            // ),

                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<AddCategoryCubit>()
                                    .deleteCategoryFromDatabase(index);
                                context
                                    .read<AppCubit>()
                                    .changeIncomeCategoryPage();
                              },
                              child: AutoSizeText(
                                'Kategori Sil',
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
