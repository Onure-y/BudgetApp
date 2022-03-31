import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/movement_comp.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/allMovementsCubit/allMovement_cubit.dart';
import 'package:budget_app/cubits/allMovementsCubit/allMovement_state.dart';
import 'package:budget_app/helper/color_converter.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:budget_app/views/main_view.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AllMovementsPage extends StatelessWidget {
  const AllMovementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();

    String? selectedValue;
    String? selectedValue2;
    List<String> categories = [];
    List<String> customers = [];
    List<String> sortList = [
      'En Yuksek Fiyat',
      'En Dusuk Fiyat',
      'En Yeniler',
      'En Eskiler'
    ];

    return BlocProvider(
      create: (context) => AllMovementCubit(userRepository: userRepository),
      child: BlocBuilder<AllMovementCubit, AllMovementsState>(
        builder: (context, state) {
          if (state is AllMovementsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AllMovementsLoadedState) {
            categories.clear();
            customers.clear();
            List<MovementModel> movements = state.movements;
            for (CategoryModel category in state.allCategories) {
              categories.add(category.categoryName);
            }
            for (CustomerModel customer in state.allCustomers) {
              customers.add(customer.firstName);
            }
            return Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    height: 75,
                    width: double.infinity,
                    color: lightColor,
                    child: AutoSizeText(
                      'Hareketler',
                      minFontSize: 36,
                      style: secondryMediumTextStyle,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 60,
                          width: 250,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.search),
                              const SizedBox(width: 10),
                              Flexible(
                                child: TextFormField(
                                  cursorColor: secondaryDarkColor,
                                  style: secondryNormalTextStyle,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(right: 50.0, top: 20.0),
                              child: movements.isNotEmpty
                                  ? ListView.builder(
                                      controller: state.scrollController,
                                      itemCount: movements.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        MovementModel movementModel = movements[
                                            (movements.length - 1) - index];
                                        return MovementComp(
                                          dateTime:
                                              DateTimeHelper.epochToDataTime(
                                                      movementModel.time)
                                                  .toString(),
                                          icon: Icon(IconHelperPackage.icons[
                                              movementModel.isCategoryMovement
                                                  ? movementModel.category
                                                      .categoryIconIndex
                                                  : movementModel.customer
                                                      .customerIconIndex]),
                                          movementCategoryColor: ColorConverter
                                              .convertColorFromString(
                                            movementModel.isCategoryMovement
                                                ? movementModel
                                                    .category.containerColor
                                                : movementModel
                                                    .customer.containerColor,
                                          ),
                                          movementCategoryName:
                                              movementModel.isCategoryMovement
                                                  ? movementModel
                                                      .category.categoryName
                                                  : movementModel
                                                      .customer.firstName,
                                          movementName:
                                              movementModel.movementText,
                                          movementValue: movementModel
                                              .movementValue
                                              .toString(),
                                        );
                                      })
                                  : Container(
                                      child: Center(
                                        child: Text(
                                          state.movements.length.toString(),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      AutoSizeText(
                                        'Sirala',
                                        style: secondryNormalTextStyle,
                                        minFontSize: 24,
                                      ),
                                      Builder(builder: (newContext) {
                                        return CustomDropdownButton2(
                                          hint: 'Siralama Tipi',
                                          dropdownItems: sortList,
                                          value: selectedValue,
                                          onChanged: (sortName) {
                                            int index =
                                                sortList.indexOf(sortName!);
                                            if (index == 0) {
                                              newContext
                                                  .read<AllMovementCubit>()
                                                  .sortByHigherOrder();
                                            }
                                            if (index == 1) {
                                              newContext
                                                  .read<AllMovementCubit>()
                                                  .sortByLowerOrder();
                                            }
                                            if (index == 2) {
                                              newContext
                                                  .read<AllMovementCubit>()
                                                  .sortByHigherTime();
                                            }
                                            if (index == 3) {
                                              newContext
                                                  .read<AllMovementCubit>()
                                                  .sortByLowerTime();
                                            }
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      AutoSizeText(
                                        'Kategori',
                                        style: secondryNormalTextStyle,
                                        minFontSize: 24,
                                      ),
                                      Builder(builder: (newContext) {
                                        return CustomDropdownButton2(
                                          hint: 'Kategori Sec',
                                          dropdownItems: categories,
                                          value: selectedValue,
                                          onChanged: (categoryName) {
                                            newContext
                                                .read<AllMovementCubit>()
                                                .getSelectedCategoryMovements(
                                                    categoryName!);
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      AutoSizeText(
                                        'Kisi',
                                        style: secondryNormalTextStyle,
                                        minFontSize: 24,
                                      ),
                                      Builder(builder: (newContext) {
                                        return CustomDropdownButton2(
                                          hint: 'Kisi Sec',
                                          dropdownItems: customers,
                                          value: selectedValue2,
                                          onChanged: (customerName) {
                                            newContext
                                                .read<AllMovementCubit>()
                                                .getSelectedCustomerMovements(
                                                  customerName!,
                                                );
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                  Builder(builder: (newContext) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        newContext
                                            .read<AllMovementCubit>()
                                            .initState();
                                      },
                                      child: AutoSizeText('Varsayilana Don',
                                          minFontSize: 18,
                                          style: primaryNormalTextStyle),
                                      style: ElevatedButton.styleFrom(
                                        primary: primaryLightColor,
                                        minimumSize: const Size(100, 50),
                                      ),
                                    );
                                  })
                                ],
                              ),
                            ),
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
