import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/cubits/userCubit/user_cubit.dart';
import 'package:budget_app/cubits/userCubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCreatePage extends StatelessWidget {
  const UserCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext context, UserState state) {
        if (state is UserLoadingState) {
          return const AppLoadingComp();
        }
        if (state is UserNotExistState) {
          return Scaffold(
            body: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/loginPageBackgorund.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/app_icon.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 75,
                        child: Center(
                          child: AutoSizeText(
                            'HesApp',
                            style: primaryMediumTextStyle,
                            minFontSize: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      child: Center(
                        child: Container(
                          width: size.width * .4,
                          height: size.width * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: bluredBackgroundColor,
                          ),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AutoSizeText(
                                    'Kullanici Olustur',
                                    style: primaryNormalTextStyle,
                                    minFontSize: 32,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0),
                                      child: TextFormField(
                                        controller:
                                            state.firstNameTextController,
                                        cursorColor: primaryDarkColor,
                                        style: primaryNormalTextStyle,
                                        decoration: InputDecoration(
                                          labelText: 'Isim',
                                          labelStyle: primaryNormalTextStyle,
                                          filled: true,
                                          fillColor: secondaryDarkColor,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0),
                                      child: TextFormField(
                                        controller:
                                            state.lastNameTextController,
                                        cursorColor: primaryDarkColor,
                                        style: primaryNormalTextStyle,
                                        decoration: InputDecoration(
                                          labelText: 'Soy Isim',
                                          labelStyle: primaryNormalTextStyle,
                                          filled: true,
                                          fillColor: secondaryDarkColor,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0),
                                      child: TextFormField(
                                        controller:
                                            state.companyNameTextController,
                                        cursorColor: primaryDarkColor,
                                        style: primaryNormalTextStyle,
                                        decoration: InputDecoration(
                                          labelText: 'Sirket ismi',
                                          labelStyle: primaryNormalTextStyle,
                                          filled: true,
                                          fillColor: secondaryDarkColor,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Builder(builder: (newContext) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      debugPrint(
                                          state.firstNameTextController.text);
                                      debugPrint(
                                          state.lastNameTextController.text);
                                      debugPrint(
                                          state.companyNameTextController.text);

                                      newContext.read<UserCubit>().createUser();
                                    },
                                    child: AutoSizeText(
                                      'Giris Yap',
                                      style: primaryMediumTextStyle,
                                      minFontSize: 24,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: secondaryDarkColor,
                                      padding: const EdgeInsets.all(15.0),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
