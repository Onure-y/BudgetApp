import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/components/painter.comp.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/overviewCubit/overview%20_cubit.dart';
import 'package:budget_app/cubits/overviewCubit/overview_state.dart';
import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
    String? selectedValue;
    List<String> items = [
      'Ocak',
      'Subat',
      'Mart',
      'Nisan',
    ];

    List<OverviewChartModel> data2 = [
      OverviewChartModel(month: 0, moneyValue: 100),
      OverviewChartModel(month: 1, moneyValue: 250),
      OverviewChartModel(month: 2, moneyValue: 300),
      OverviewChartModel(month: 3, moneyValue: 175),
      OverviewChartModel(month: 4, moneyValue: 95),
      OverviewChartModel(month: 5, moneyValue: 70),
      OverviewChartModel(month: 6, moneyValue: 110),
      OverviewChartModel(month: 7, moneyValue: 220),
    ];

    return BlocProvider(
      create: (context) => OverviewCubit(userRepository: userRepository),
      child: BlocBuilder<OverviewCubit, OverviewPageState>(
          builder: (BuildContext context, OverviewPageState state) {
        if (state is OverviewPageLoadingState) {
          return AppLoadingComp();
        }
        if (state is OverviewPageLoadedState) {
          return Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  height: 75,
                  width: double.infinity,
                  color: lightColor,
                  child: AutoSizeText(
                    'Work In Progress',
                    minFontSize: 36,
                    style: secondryMediumTextStyle,
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                              'Genel Hareket Dagilimi',
                                              style: secondryMediumTextStyle,
                                              minFontSize: 24,
                                            ),
                                            CustomDropdownButton2(
                                              hint: 'Select Item',
                                              dropdownItems: items,
                                              value: selectedValue,
                                              onChanged: (value) {},
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Container(
                                            child: LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                return Row(
                                                  children: [
                                                    Container(
                                                      height: constraints
                                                              .maxHeight *
                                                          0.9,
                                                      width: constraints
                                                              .maxHeight *
                                                          0.9,
                                                      child: CustomPaint(
                                                        foregroundPainter:
                                                            MyPainter(
                                                          state.yearlyIncomeDeg,
                                                          incomeColor,
                                                          constraints.maxHeight <
                                                                  300
                                                              ? 30
                                                              : 60,
                                                        ),
                                                        painter:
                                                            MySecondaryPainter(
                                                          360,
                                                          secondryIncomeColor,
                                                          0,
                                                          constraints.maxHeight <
                                                                  300
                                                              ? 30
                                                              : 60,
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      AutoSizeText(
                                                                        'Sirket Geliri',
                                                                        minFontSize:
                                                                            16,
                                                                        style:
                                                                            secondryMediumTextStyle,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  AutoSizeText(
                                                                    state
                                                                        .yearlyIncome
                                                                        .toStringAsFixed(
                                                                            2),
                                                                    minFontSize:
                                                                        16,
                                                                    style:
                                                                        secondryMediumTextStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      const CircleAvatar(
                                                                        backgroundColor:
                                                                            secondryIncomeColor,
                                                                        radius:
                                                                            10,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      AutoSizeText(
                                                                        'Sirket Giderleri',
                                                                        minFontSize:
                                                                            16,
                                                                        style:
                                                                            secondryMediumTextStyle,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  AutoSizeText(
                                                                    state
                                                                        .yearlyExpense
                                                                        .toStringAsFixed(
                                                                            2),
                                                                    minFontSize:
                                                                        16,
                                                                    style:
                                                                        secondryMediumTextStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          'Genel Dagilim',
                                          style: secondryMediumTextStyle,
                                          minFontSize: 24,
                                        ),
                                        Flexible(
                                          child: Container(
                                            child: GridView.builder(
                                                itemCount: 6,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 3,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return const OverviewPageComp(
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .solidBuilding,
                                                        size: 32,
                                                      ),
                                                      name: 'Toplam Gelir',
                                                      moneyValue:
                                                          '1,245,450 Tl');
                                                }),
                                          ),
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
                          child: Container(
                            child: SfCartesianChart(
                              tooltipBehavior: tooltipBehavior,
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                // Renders area chart

                                AreaSeries<OverviewChartModel, String>(
                                  legendItemText: 'Gider',
                                  enableTooltip: true,
                                  color: expenseColor,
                                  name: 'Gider',
                                  dataSource: data2,
                                  xValueMapper: (OverviewChartModel data, _) =>
                                      TimerPackage.months[data.month],
                                  yValueMapper: (OverviewChartModel data, _) =>
                                      data.moneyValue,
                                  gradient: expenseChartGradientColor,
                                ),
                                AreaSeries<OverviewChartModel, String>(
                                  legendItemText: 'Gelir',
                                  enableTooltip: true,
                                  color: incomeColor,
                                  name: 'Gelir',
                                  dataSource: state.yearlyIncomeMovements,
                                  xValueMapper: (OverviewChartModel data, _) =>
                                      TimerPackage.months[data.month],
                                  yValueMapper: (OverviewChartModel data, _) =>
                                      data.moneyValue,
                                  gradient: incomeChartGradientColor,
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
        } else {
          return Container();
        }
      }),
    );
  }
}

class OverviewChartModel {
  int month;
  double moneyValue;

  OverviewChartModel({required this.month, required this.moneyValue});
}

class OverviewPageComp extends StatelessWidget {
  const OverviewPageComp({
    Key? key,
    required this.icon,
    required this.name,
    required this.moneyValue,
  }) : super(key: key);

  final FaIcon icon;
  final String name;
  final String moneyValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              name,
              style: thinNormalTextStyle,
              minFontSize: 16,
            ),
            AutoSizeText(
              moneyValue,
              style: secondryNormalTextStyle,
              minFontSize: 14,
            ),
          ],
        ),
      ],
    );
  }
}
