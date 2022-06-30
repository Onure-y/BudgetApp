import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/settingsCubit/settings_cubit.dart';
import 'package:budget_app/cubits/settingsCubit/settings_state.dart';
import 'package:budget_app/cubits/userCubit/user_cubit.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    return BlocProvider(
      create: (context) => SettingsCubit(userRepository: userRepository),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              height: 75,
              width: double.infinity,
              color: lightColor,
              child: AutoSizeText(
                'Ayarlar',
                minFontSize: 36,
                style: secondryMediumTextStyle,
              ),
            ),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (BuildContext context, SettingsState state) {
                if (state is SettingsLoadingState) {
                  return const Flexible(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is SettingsLoadedState) {
                  return Flexible(
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Builder(builder: (newContext) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      newContext
                                          .read<SettingsCubit>()
                                          .createUser();
                                    },
                                    child: const Text('Kullanici Olustur'),
                                  );
                                }),
                                const SizedBox(
                                  width: 100,
                                ),
                                Builder(builder: (newContext) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      newContext
                                          .read<SettingsCubit>()
                                          .createIncomeMovement();
                                    },
                                    child: const Text(
                                        'income movement verisi ekle'),
                                  );
                                }),
                                const SizedBox(
                                  width: 100,
                                ),
                                Builder(builder: (newContext) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      newContext
                                          .read<SettingsCubit>()
                                          .deleteUser();

                                      context.read<UserCubit>().signOut();
                                    },
                                    child: const Text('kullanici veri sifirla'),
                                  );
                                }),
                                const SizedBox(
                                  width: 100,
                                ),
                                Builder(builder: (newContext) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      newContext
                                          .read<SettingsCubit>()
                                          .deleteAllMovements();
                                    },
                                    child: const Text(
                                        'kullanici hareketleri sifirla'),
                                  );
                                }),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Builder(builder: (newContext) {
                              return ElevatedButton(
                                onPressed: () {
                                  newContext
                                      .read<SettingsCubit>()
                                      .createNewForwardMovement();
                                },
                                child: const Text('ileri sureli hareket ekle'),
                              );
                            }),
                            const SizedBox(height: 20),
                            state.userModel.firstName == ''
                                ? Text('Isim yok')
                                : Text(
                                    state.userModel.firstName,
                                  ),
                            /*    const SizedBox(height: 200),
                            state.userModel.firstName == ''
                                ? Text('veri yok')
                                : Text(
                                    state.userModel.allMovements[0].time
                                        .toString(),
                                  ), */
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(child: const Text('Error'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
