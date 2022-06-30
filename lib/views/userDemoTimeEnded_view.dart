import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/demoEndCubit/demoEnd_cubit.dart';
import 'package:budget_app/cubits/demoEndCubit/demoEnd_state.dart';
import 'package:budget_app/cubits/profileCubit/profile_cubit.dart';
import 'package:budget_app/cubits/userCubit/user_cubit.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDemoTimeEndPage extends StatelessWidget {
  const UserDemoTimeEndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsRepository settingsRepository = context.read<SettingsRepository>();
    UserRepository userRepository = context.read<UserRepository>();

    return Scaffold(
      body: BlocProvider(
        create: (context) => DemoEndTimeCubit(
          userRepository: userRepository,
          settingsRepository: settingsRepository,
        ),
        child: BlocBuilder<DemoEndTimeCubit, DemoEndPageState>(
          builder: (BuildContext context, DemoEndPageState state) {
            if (state is DemoEndPageLoadingState) {
              return const AppLoadingComp();
            }
            if (state is DemoEndPageLoadedState) {
              return Container(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    height: 75,
                    width: double.infinity,
                    color: lightColor,
                    child: Center(
                      child: AutoSizeText(
                        'Demo Süreniz Sona Ermiştir',
                        minFontSize: 36,
                        style: secondryMediumTextStyle,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Flexible(
                            flex: 5,
                            fit: FlexFit.tight,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF0F1F6),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: primaryDarkColor,
                                        width: 5,
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/profile-picture.png'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'o',
                                        style: secondryMediumTextStyle,
                                        minFontSize: 36,
                                      ),
                                      AutoSizeText(
                                        'a',
                                        style: semiThinNormalTextStyle,
                                        minFontSize: 24,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      child: Column(
                    children: [
                      Container(
                        width: 300,
                        child: TextFormField(
                          controller: state.demoTextField,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.black),
                            hintText: "*********",
                            hintStyle: secondryMediumTextStyle,
                            fillColor: const Color(0xffF0F1F6),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffDDDDDD), width: 4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffDDDDDD), width: 4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      BlocProvider(
                        create: (context) => UserCubit(
                            settingsRepository: settingsRepository,
                            userRepository: userRepository),
                        child: Builder(builder: (newContext) {
                          return ElevatedButton(
                            onPressed: () {
                              newContext.read<UserCubit>().setUserPremium();
                            },
                            child: AutoSizeText(
                              'Doğrula',
                              style: primaryNormalTextStyle,
                              minFontSize: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ))
                ],
              ));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
