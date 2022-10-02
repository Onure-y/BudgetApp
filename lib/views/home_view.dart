import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/cubits/appCubit/app_cubit_state.dart';
import 'package:budget_app/cubits/navigationCubit/navigation_cubit.dart';
import 'package:budget_app/cubits/navigationCubit/navigation_cubit_state.dart';
import 'package:budget_app/cubits/userInfoCubit/userInfo_cubit.dart';
import 'package:budget_app/cubits/userInfoCubit/userInfo_state.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:budget_app/views/addCategoryMovement_view.dart';
import 'package:budget_app/views/addClient_view.dart';
import 'package:budget_app/views/addCustomerMovement_view.dart';
import 'package:budget_app/views/addIncomeCategory_view.dart';
import 'package:budget_app/views/allMovements_view.dart';
import 'package:budget_app/views/categoryEdit_view.dart';
import 'package:budget_app/views/chooseMovementType_view.dart';
import 'package:budget_app/views/clientEdit_view.dart';
import 'package:budget_app/views/clients_view.dart';
import 'package:budget_app/views/incomeCategory_view.dart';
import 'package:budget_app/views/main_view.dart';
import 'package:budget_app/views/overview_view.dart';
import 'package:budget_app/views/profile_view.dart';
import 'package:budget_app/views/settings_view.dart';
import 'package:budget_app/views/userDemoTimeEnded_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  Widget build(context) {
    UserRepository userRepository = context.read<UserRepository>();

    List<String> titles = [
      'Ana Sayfa',
      'Hareketler',
      'Genel Bakiş',
      'Kategoriler',
      'Kişiler',
      'Profil',
      'Ayarlar'
    ];

    List<FaIcon> icons = const [
      FaIcon(
        FontAwesomeIcons.home,
        color: primaryTextColor,
      ),
      FaIcon(
        FontAwesomeIcons.listUl,
        color: primaryTextColor,
      ),
      FaIcon(
        FontAwesomeIcons.chartPie,
        color: primaryTextColor,
      ),
      FaIcon(
        FontAwesomeIcons.boxes,
        color: primaryTextColor,
      ),
      FaIcon(
        FontAwesomeIcons.users,
        color: primaryTextColor,
      ),
      FaIcon(
        FontAwesomeIcons.solidUser,
        color: primaryTextColor,
      ),
      FaIcon(
        FontAwesomeIcons.wrench,
        color: primaryTextColor,
      ),
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
        height: 75,
        child: FloatingActionButton(
          onPressed: () {
            context.read<AppCubit>().goToChooseMovementTypePage();
          },
          backgroundColor: incomeColor,
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          ),
        ),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: size.height,
              decoration: const BoxDecoration(
                color: primaryDarkColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/app_icon.png'),
                              ),
                            ),
                          ),
                          AutoSizeText(
                            'HesApp',
                            style: primaryMediumTextStyle,
                            presetFontSizes: const [28, 22],
                            maxLines: 1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<NavigationCubit, NavigationState>(
                        builder: (BuildContext context, NavigationState state) {
                          if (state is NavigationLoading) {
                            return const AppLoadingComp();
                          }
                          if (state is NavigationLoaded) {
                            return Container(
                              // color: Colors.blue,
                              width: double.infinity,
                              height: size.height * 0.5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(
                                  titles.length,
                                  (index) => Material(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: state.onTapState[index]
                                            ? secondaryDarkColor
                                            : Colors.transparent,
                                      ),
                                      child: _NavBarLinks(
                                        title: titles[index],
                                        icon: icons[index],
                                        index: index,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                  BlocProvider(
                    create: (context) => UserInfoCubit(
                      userRepository: userRepository,
                    ),
                    child: BlocBuilder<UserInfoCubit, UserInfoState>(
                      builder: (BuildContext context, UserInfoState state) {
                        if (state is UserInfoLoadingState) {
                          return AppLoadingComp();
                        }
                        if (state is UserInfoLoadedState) {
                          return Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: secondaryDarkColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: secondaryLightColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        state.userModel.firstName,
                                        style: primaryNormalTextStyle,
                                        minFontSize: 14,
                                      ),
                                      AutoSizeText(
                                        state.userModel.companyName,
                                        style: primaryThinTextStyle,
                                        minFontSize: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: BlocBuilder<AppCubit, AppState>(
                builder: (BuildContext context, AppState state) {
              if (state is HomePageState) {
                return const MainPage();
                // return const UserDemoTimeEndPage();
              }
              if (state is AllMovementPageState) {
                return const AllMovementsPage();
              }
              if (state is OverviewPageState) {
                return const OverviewPage();
              }
              if (state is IncomeCategoryPageState) {
                return const IncomeCategoryPage();
              }

              if (state is ClientPageState) {
                return const ClientsPage();
              }
              if (state is AddIncomeCategoryPageState) {
                return const AddIncomeCategoryPage();
              }

              if (state is AddClientPageState) {
                return const AddClientPage();
              }
              if (state is SettingsPageState) {
                return const SettingsPage();
              }
              if (state is EditCategoryPageState) {
                return const CategoryEditPage();
              }
              if (state is EditClientPageState) {
                return const ClientEditPage();
              }
              if (state is AddChooseMovementTypePageState) {
                return const ChooseMovementTypePage();
              }
              if (state is AddCategoryMovementPageState) {
                return const AddCategoryMovementPage();
              }
              if (state is AddCustomerMovementPageState) {
                return const AddCustomerMovementPage();
              }
              if (state is ProfilePageState) {
                return const ProfilePage();
              } else {
                return const SizedBox(child: Center(child: Text('empty Page')));
              }
            }),
          ),
          // Flexible(
          //   flex: 5,
          //   child: MainPage(),
          // )
        ],
      ),
    );
  }
}

class _NavBarLinks extends StatefulWidget {
  _NavBarLinks({
    Key? key,
    required this.title,
    required this.icon,
    required this.index,
  }) : super(key: key);

  final String title;
  final FaIcon icon;
  final int index;

  @override
  State<_NavBarLinks> createState() => _NavBarLinksState(index);
}

class _NavBarLinksState extends State<_NavBarLinks> {
  bool isHovering = false;

  _NavBarLinksState(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint(index.toString());
        context.read<NavigationCubit>().changePage(index);
        context.read<AppCubit>().navigateToPage(index);
      },
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isHovering ? secondaryDarkColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration: const Duration(milliseconds: 200),
        child: Row(
          children: [
            Expanded(flex: 1, child: widget.icon),
            Expanded(
              flex: 2,
              child: AutoSizeText(
                widget.title,
                minFontSize: 18,
                style: primaryNormalTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
