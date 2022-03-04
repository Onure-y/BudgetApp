import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/movement_comp.dart';
import 'package:budget_app/components/painter.comp.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
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
              padding: EdgeInsets.all(30.0),
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
                                          BoxConstraints boxConstraints) {
                                        debugPrint(boxConstraints.maxHeight
                                            .toString());
                                        return Column(
                                          children: [
                                            Container(
                                              height: boxConstraints.maxWidth *
                                                  0.65,
                                              width: boxConstraints.maxWidth *
                                                  0.65,
                                              child: CustomPaint(
                                                child: Center(
                                                  child: AutoSizeText(
                                                    '24.500 TL',
                                                    minFontSize: 24,
                                                    style:
                                                        secondryMediumTextStyle,
                                                  ),
                                                ),
                                                painter: MySecondaryPainter(
                                                  360,
                                                  expenseColor,
                                                  0,
                                                  boxConstraints.maxHeight < 300
                                                      ? 20
                                                      : 40,
                                                ),
                                                foregroundPainter: MyPainter(
                                                  120,
                                                  incomeColor,
                                                  boxConstraints.maxHeight < 300
                                                      ? 20
                                                      : 40,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                  width:
                                                      boxConstraints.maxWidth *
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
                                                              radius: 10,
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            AutoSizeText(
                                                              'Gider',
                                                              minFontSize: 22,
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
                                                              radius: 10,
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            AutoSizeText(
                                                              'Gider',
                                                              minFontSize: 22,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
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
                                                  TextButton(
                                                    onPressed: () {},
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
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundColor:
                                                          incomeColor,
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .dollarSign,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    AutoSizeText(
                                                      '32.750 TL',
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
                                                MainAxisAlignment.spaceAround,
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
                                                  TextButton(
                                                    onPressed: () {},
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
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundColor:
                                                          expenseColor,
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .dollarSign,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    AutoSizeText(
                                                      '-15.220 TL',
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
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AutoSizeText(
                                                    'Butce',
                                                    minFontSize: 24,
                                                    style:
                                                        secondryMediumTextStyle,
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
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
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundColor:
                                                          balanceColor,
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .dollarSign,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    AutoSizeText(
                                                      '24.550 TL',
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
                                              style: secondryNormalTextStyle,
                                            ),
                                            AutoSizeText(
                                              'Tüm bir ay boyunca yapilan harcamalari gösterir',
                                              minFontSize: 14,
                                              style: thinNormalTextStyle,
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: SfCartesianChart(
                                            enableAxisAnimation: true,
                                            legend: Legend(
                                              isVisible: true,
                                              position: LegendPosition.auto,
                                            ),
                                            tooltipBehavior: tooltipBehavior,
                                            primaryXAxis: CategoryAxis(),
                                            series: <ChartSeries>[
                                              // Renders spline chart

                                              SplineSeries<ChartData, String>(
                                                  legendItemText: 'Gelirler',
                                                  enableTooltip: true,
                                                  color: incomeColor,
                                                  name: 'Gelirler',
                                                  width: 5,
                                                  dataSource: [
                                                    ChartData('Mar', 35),
                                                    ChartData('Nis', 13),
                                                    ChartData('May', 34),
                                                    ChartData('Haz', 27),
                                                    ChartData('Tem', 40)
                                                  ],
                                                  xValueMapper:
                                                      (ChartData sales, _) =>
                                                          sales.x,
                                                  yValueMapper:
                                                      (ChartData sales, _) =>
                                                          sales.y),
                                              SplineSeries<ChartData, String>(
                                                  legendItemText: 'Giderler',
                                                  animationDuration: 300,
                                                  enableTooltip: true,
                                                  name: "Giderler",
                                                  width: 5,
                                                  color: expenseColor,
                                                  dataSource: [
                                                    ChartData('Mar', 15),
                                                    ChartData('Nis', 32),
                                                    ChartData('May', 21),
                                                    ChartData('Haz', 36),
                                                    ChartData('Tem', 11)
                                                  ],
                                                  xValueMapper:
                                                      (ChartData sales, _) =>
                                                          sales.x,
                                                  yValueMapper:
                                                      (ChartData sales, _) =>
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
                                              MainAxisAlignment.spaceBetween,
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
                                                  style: thinNormalTextStyle,
                                                ),
                                              ],
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: AutoSizeText(
                                                'Tumunu Gor',
                                                minFontSize: 18,
                                                style: semiThinNormalTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: List.filled(
                                            3,
                                            Column(
                                              children: const [
                                                MovementComp(
                                                  icon: Icon(
                                                    Icons.home_outlined,
                                                    color: Colors.black,
                                                    size: 36,
                                                  ),
                                                  dateTime:
                                                      '04/01/2022 - 15:30',
                                                  movementCategoryColor:
                                                      incomeColor,
                                                  movementCategoryName:
                                                      'Sirket Harcamalari',
                                                  movementName: 'Rise Software',
                                                  movementValue: '-12.000',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
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
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
