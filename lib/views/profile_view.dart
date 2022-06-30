import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/profileCubit/profile_cubit.dart';
import 'package:budget_app/cubits/profileCubit/profile_state.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsRepository settingsRepository = context.read<SettingsRepository>();
    UserRepository userRepository = context.read<UserRepository>();

    return BlocProvider(
      create: (context) => ProfileCubit(
        userRepository: userRepository,
        settingsRepository: settingsRepository,
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoadingState) {
          return AppLoadingComp();
        }
        if (state is ProfileLoadedState) {
          return Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  height: 75,
                  width: double.infinity,
                  color: lightColor,
                  child: AutoSizeText(
                    'Profil',
                    minFontSize: 36,
                    style: secondryMediumTextStyle,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      state.fullName,
                                      style: secondryMediumTextStyle,
                                      minFontSize: 36,
                                    ),
                                    AutoSizeText(
                                      state.companyName,
                                      style: semiThinNormalTextStyle,
                                      minFontSize: 24,
                                    ),
                                    Row(
                                      children: [
                                        state.isPremium
                                            ? AutoSizeText(
                                                'Premium',
                                                style: premiumColor(true),
                                                minFontSize: 16,
                                              )
                                            : AutoSizeText(
                                                'Premium',
                                                style: premiumColor(false),
                                                minFontSize: 16,
                                              ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        AutoSizeText('Kalan Süre - ',
                                            minFontSize: 16,
                                            style: semiThinNormalTextStyle),
                                        AutoSizeText(
                                            state.remainingDay.toString(),
                                            minFontSize: 18,
                                            style: secondryMediumTextStyle),
                                      ],
                                    )
                                  ],
                                )
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
      }),
    );
  }
}
