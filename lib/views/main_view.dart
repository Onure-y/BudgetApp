import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/movement_comp.dart';
import 'package:budget_app/components/painter.comp.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/cubits/homePageCubit/homePage_cubit.dart';
import 'package:budget_app/cubits/homePageCubit/homePage_state.dart';
import 'package:budget_app/cubits/navigationCubit/navigation_cubit.dart';
import 'package:budget_app/helper/color_converter.dart';
import 'package:budget_app/helper/icon_package.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    SettingsRepository settingsRepository = context.read<SettingsRepository>();
    TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
    return BlocProvider(
      create: (context) => HomePageCubit(
        userRepository: userRepository,
        settingsRepository: settingsRepository,
      ),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (BuildContext context, HomePageState state) {
          if (state is HomePageLoadedState) {
            UserModel userModel = state.userModel;

            return Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    height: 75,
                    width: double.infinity,
                    color: lightColor,
                    child: AutoSizeText(
                      'Ana Sayfa',
                      minFontSize: 36,
                      style: secondryMediumTextStyle,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            child: LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints
                                                      boxConstraints) {
                                                debugPrint(boxConstraints
                                                    .maxHeight
                                                    .toString());
                                                return Column(
                                                  children: [
                                                    Container(
                                                      height: boxConstraints
                                                              .maxWidth *
                                                          0.65,
                                                      width: boxConstraints
                                                              .maxWidth *
                                                          0.65,
                                                      child: CustomPaint(
                                                        child: Center(
                                                          child: AutoSizeText(
                                                            state
                                                                    .userModel
                                                                    .allMovements
                                                                    .isEmpty
                                                                ? '*******'
                                                                : state
                                                                    .budgetValue
                                                                    .toStringAsFixed(
                                                                        2),
                                                            minFontSize: 24,
                                                            style:
                                                                secondryMediumTextStyle,
                                                          ),
                                                        ),
                                                        painter:
                                                            MySecondaryPainter(
                                                          360,
                                                          expenseColor,
                                                          0,
                                                          boxConstraints
                                                                      .maxHeight <
                                                                  300
                                                              ? 20
                                                              : 40,
                                                        ),
                                                        foregroundPainter:
                                                            MyPainter(
                                                          state.incomeDeg,
                                                          incomeColor,
                                                          boxConstraints
                                                                      .maxHeight <
                                                                  300
                                                              ? 20
                                                              : 40,
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                          width: boxConstraints
                                                                  .maxWidth *
                                                              0.7,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    const CircleAvatar(
                                                                      backgroundColor:
                                                                          incomeColor,
                                                                      radius:
                                                                          10,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    AutoSizeText(
                                                                      'Gelir',
                                                                      minFontSize:
                                                                          22,
                                                                      style:
                                                                          secondryMediumTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const CircleAvatar(
                                                                      backgroundColor:
                                                                          expenseColor,
                                                                      radius:
                                                                          10,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    AutoSizeText(
                                                                      'Gider',
                                                                      minFontSize:
                                                                          22,
                                                                      style:
                                                                          secondryMediumTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          AutoSizeText(
                                                            'Gelir',
                                                            minFontSize: 24,
                                                            style:
                                                                secondryMediumTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      Flexible(
                                                        child: Row(
                                                          children: [
                                                            const CircleAvatar(
                                                              backgroundColor:
                                                                  incomeColor,
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .dollarSign,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            AutoSizeText(
                                                              state
                                                                      .userModel
                                                                      .allMovements
                                                                      .isEmpty
                                                                  ? '*******'
                                                                  : '${state.incomeValue.toStringAsFixed(2)} TL',
                                                              style:
                                                                  secondryNormalTextStyle,
                                                              minFontSize: 24,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          AutoSizeText(
                                                            'Gider',
                                                            minFontSize: 24,
                                                            style:
                                                                secondryMediumTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      Flexible(
                                                        child: Row(
                                                          children: [
                                                            const CircleAvatar(
                                                              backgroundColor:
                                                                  expenseColor,
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .dollarSign,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            AutoSizeText(
                                                              state
                                                                      .userModel
                                                                      .allMovements
                                                                      .isEmpty
                                                                  ? '*******'
                                                                  : '${state.expenseValue.toStringAsFixed(2)} TL',
                                                              style:
                                                                  secondryNormalTextStyle,
                                                              minFontSize: 24,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          AutoSizeText(
                                                            'Bütçe',
                                                            minFontSize: 24,
                                                            style:
                                                                secondryMediumTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      Flexible(
                                                        child: Row(
                                                          children: [
                                                            const CircleAvatar(
                                                              backgroundColor:
                                                                  balanceColor,
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .dollarSign,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            AutoSizeText(
                                                              state
                                                                      .userModel
                                                                      .allMovements
                                                                      .isEmpty
                                                                  ? '*******'
                                                                  : '${state.budgetValue.toStringAsFixed(2)} TL',
                                                              style:
                                                                  secondryNormalTextStyle,
                                                              minFontSize: 24,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Gelirler/Giderler',
                                                      minFontSize: 24,
                                                      style:
                                                          secondryNormalTextStyle,
                                                    ),
                                                    AutoSizeText(
                                                      'Tüm bir ay boyunca yapilan harcamalari gösterir',
                                                      minFontSize: 14,
                                                      style:
                                                          semiThinNormalTextStyle,
                                                    ),
                                                  ],
                                                ),
                                                Flexible(
                                                  child: SfCartesianChart(
                                                    enableAxisAnimation: true,
                                                    legend: Legend(
                                                      isVisible: true,
                                                      position:
                                                          LegendPosition.auto,
                                                    ),
                                                    tooltipBehavior:
                                                        tooltipBehavior,
                                                    primaryXAxis:
                                                        CategoryAxis(),
                                                    series: <ChartSeries>[
                                                      // Renders spline chart

                                                      LineSeries<
                                                              ChartData, String>(
                                                          legendItemText:
                                                              'Gelirler',
                                                          enableTooltip: true,
                                                          color: incomeColor,
                                                          name: 'Gelirler',
                                                          width: 5,
                                                          dataSource: state
                                                                  .monthlyIncomeMovements
                                                                  .isEmpty
                                                              ? []
                                                              : state
                                                                  .monthlyIncomeMovements,
                                                          xValueMapper:
                                                              (ChartData sales,
                                                                      _) =>
                                                                  sales.x,
                                                          yValueMapper:
                                                              (ChartData sales,
                                                                      _) =>
                                                                  sales.y),
                                                      LineSeries<
                                                              ChartData, String>(
                                                          legendItemText:
                                                              'Giderler',
                                                          animationDuration:
                                                              300,
                                                          enableTooltip: true,
                                                          name: "Giderler",
                                                          width: 5,
                                                          color: expenseColor,
                                                          dataSource: state
                                                                  .monthlyExpenseMovements
                                                                  .isEmpty
                                                              ? []
                                                              : state
                                                                  .monthlyExpenseMovements,
                                                          xValueMapper:
                                                              (ChartData sales,
                                                                      _) =>
                                                                  sales.x,
                                                          yValueMapper:
                                                              (ChartData sales,
                                                                      _) =>
                                                                  sales.y),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AutoSizeText(
                                                          'Gelirler/Giderler',
                                                          minFontSize: 24,
                                                          style:
                                                              secondryNormalTextStyle,
                                                        ),
                                                        AutoSizeText(
                                                          'Yapilan son harcamalar',
                                                          minFontSize: 14,
                                                          style:
                                                              semiThinNormalTextStyle,
                                                        ),
                                                      ],
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        context
                                                            .read<AppCubit>()
                                                            .navigateToPage(1);
                                                        context
                                                            .read<
                                                                NavigationCubit>()
                                                            .changePage(1);
                                                      },
                                                      child: AutoSizeText(
                                                        'Tumunu Gor',
                                                        minFontSize: 18,
                                                        style:
                                                            semiThinNormalTextStyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Flexible(
                                                  child: state.userModel
                                                          .allMovements.isEmpty
                                                      ? Center(
                                                          child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(60.0),
                                                          child: AutoSizeText(
                                                            'Hic harcama gecmisi bulamadik hadi bitane yaratalim !!',
                                                            style:
                                                                secondryNormalTextStyle,
                                                            minFontSize: 20,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ))
                                                      : ListView.builder(
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: userModel
                                                                      .allMovements
                                                                      .length <
                                                                  4
                                                              ? userModel
                                                                  .allMovements
                                                                  .length
                                                              : 4,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            MovementModel
                                                                movementModel =
                                                                userModel
                                                                    .allMovements[state
                                                                        .userModel
                                                                        .allMovements
                                                                        .length -
                                                                    index -
                                                                    1];
                                                            return MovementComp(
                                                              dateTime: DateTimeHelper
                                                                      .epochToDataTime(
                                                                          movementModel
                                                                              .time)
                                                                  .toString(),
                                                              icon: Icon(
                                                                IconHelperPackage
                                                                    .icons[movementModel
                                                                        .isCategoryMovement
                                                                    ? movementModel
                                                                        .category
                                                                        .categoryIconIndex
                                                                    : movementModel
                                                                        .customer
                                                                        .customerIconIndex],
                                                              ),
                                                              movementCategoryColor:
                                                                  ColorConverter
                                                                      .convertColorFromString(
                                                                movementModel
                                                                        .isCategoryMovement
                                                                    ? movementModel
                                                                        .category
                                                                        .containerColor
                                                                    : movementModel
                                                                        .customer
                                                                        .containerColor,
                                                              ),
                                                              movementCategoryName: movementModel.isCategoryMovement
                                                                  ? movementModel
                                                                      .category
                                                                      .categoryName
                                                                  : movementModel
                                                                      .customer
                                                                      .firstName,
                                                              movementName:
                                                                  movementModel
                                                                      .movementText,
                                                              movementValue:
                                                                  movementModel
                                                                      .movementValue
                                                                      .toStringAsFixed(
                                                                          2),
                                                            );
                                                          }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (state is HomePageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryDarkColor,
                strokeWidth: 2,
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

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  double? y;
}

class DateTimeHelper {
  static String epochToDataTime(int epoch) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(epoch);
    String time = DateFormat('dd/MM/yyyy, HH:mm').format(date).toString();
    return time;
  }
}
