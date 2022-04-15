import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addClientCubit/addClient_cubit.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/cubits/customerCubit/customer_cubit.dart';
import 'package:budget_app/cubits/customerCubit/customer_state.dart';
import 'package:budget_app/helper/color_converter.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();

    return BlocProvider(
      create: (context) => CustomerCubit(userRepository: userRepository),
      child: BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) {
          if (state is CustomerLoadingState) {
            return AppLoadingComp();
          }
          if (state is CustomerLoadedState) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    height: 75,
                    width: double.infinity,
                    color: lightColor,
                    child: AutoSizeText(
                      'Kisiler',
                      minFontSize: 36,
                      style: secondryMediumTextStyle,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        children: [
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
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 40,
                                  crossAxisSpacing: 50,
                                  childAspectRatio: 1,
                                ),
                                children: List.generate(
                                  state.userModel.allCustomers.length + 1,
                                  (index) {
                                    if (index ==
                                        state.userModel.allCustomers.length) {
                                      return InkWell(
                                        onTap: () {
                                          context
                                              .read<AppCubit>()
                                              .goToAddClientPage();
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
                                                  'Kisi Ekle',
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
                                      CustomerModel customerModel =
                                          state.userModel.allCustomers[index];
                                      return InkWell(
                                        onTap: () {
                                          context
                                              .read<AppCubit>()
                                              .goToEditClientPage(index);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorConverter
                                                .convertColorFromString(
                                                    customerModel
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
                                                      customerModel
                                                          .customerIconIndex],
                                                  size: 64,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                AutoSizeText(
                                                    customerModel.firstName,
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
