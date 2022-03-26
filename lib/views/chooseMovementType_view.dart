import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseMovementTypePage extends StatelessWidget {
  const ChooseMovementTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    context.read<AppCubit>().navigateToPage(0);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 32,
                  ),
                  label: AutoSizeText(
                    'Hareket Türü Seçin',
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
            child: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        context.read<AppCubit>().goToAddCategoryMovementPage();
                      },
                      child: Container(
                        height: size.height * .35,
                        width: size.height * .35,
                        decoration: BoxDecoration(
                          color: incomeColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconHelperPackage.icons[18],
                                size: 64,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AutoSizeText('Kategori',
                                  style: primaryNormalTextStyle,
                                  minFontSize: 28),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    InkWell(
                      onTap: () async {
                        context.read<AppCubit>().goToAddCustomerMovementPage();
                      },
                      child: Container(
                        height: size.height * .35,
                        width: size.height * .35,
                        decoration: BoxDecoration(
                          color: incomeColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person,
                                size: 64,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AutoSizeText('Kisi',
                                  style: primaryNormalTextStyle,
                                  minFontSize: 28),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
