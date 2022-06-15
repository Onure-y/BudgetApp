import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/profileCubit/profile_cubit.dart';
import 'package:budget_app/cubits/profileCubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (BuildContext context, ProfileState state) {
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
                                    'Onur Emre YILDIRIM',
                                    style: secondryMediumTextStyle,
                                    minFontSize: 36,
                                  ),
                                  AutoSizeText(
                                    'Rise Software',
                                    style: semiThinNormalTextStyle,
                                    minFontSize: 24,
                                  ),
                                  AutoSizeText(
                                    'Premium',
                                    style: premiumColor(true),
                                    minFontSize: 15,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "En çok gider işlemi yapılan Kategori",
                                        style: secondryMediumTextStyle,
                                        minFontSize: 16,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.blue,
                                          ),
                                          const SizedBox(width: 20),
                                          AutoSizeText(
                                            "Malzemeler",
                                            style: secondryNormalTextStyle,
                                            minFontSize: 14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "En çok gelir işlemi yapılan Kategori",
                                        style: secondryMediumTextStyle,
                                        minFontSize: 16,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.blue,
                                          ),
                                          const SizedBox(width: 20),
                                          AutoSizeText(
                                            "Malzemeler",
                                            style: secondryNormalTextStyle,
                                            minFontSize: 14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "En çok gider işlemi yapılan Kategori",
                                        style: secondryMediumTextStyle,
                                        minFontSize: 16,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.blue,
                                          ),
                                          const SizedBox(width: 20),
                                          AutoSizeText(
                                            "Malzemeler",
                                            style: secondryNormalTextStyle,
                                            minFontSize: 14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "En çok gelir işlemi yapılan Kategori",
                                        style: secondryMediumTextStyle,
                                        minFontSize: 16,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.blue,
                                          ),
                                          const SizedBox(width: 20),
                                          AutoSizeText(
                                            "Malzemeler",
                                            style: secondryNormalTextStyle,
                                            minFontSize: 14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
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
      }),
    );
  }
}
