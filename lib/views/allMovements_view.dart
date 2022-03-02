import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/components/movement_comp.dart';
import 'package:budget_app/constant.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AllMovementsPage extends StatelessWidget {
  const AllMovementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];

    List<Map<String, dynamic>> categories = [
      {'id': 0, 'text': 'Maaslar'},
      {'id': 1, 'text': 'Faturalar'},
      {'id': 2, 'text': 'Vergiler'},
      {'id': 3, 'text': 'Malzemeler'},
      {'id': 4, 'text': 'Harcamalar'},
    ];
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            height: 75,
            width: double.infinity,
            color: lightColor,
            child: AutoSizeText(
              'Hareketler',
              minFontSize: 36,
              style: secondryMediumTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                            child: FaIcon(FontAwesomeIcons.caretLeft)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                            child: FaIcon(FontAwesomeIcons.caretRight)),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 250,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.search),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextFormField(
                          cursorColor: secondaryDarkColor,
                          style: secondryNormalTextStyle,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.only(right: 50.0, top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.filled(
                          7,
                          Column(
                            children: const [
                              MovementComp(
                                icon: Icon(
                                  Icons.home_outlined,
                                  color: Colors.black,
                                  size: 48,
                                ),
                                dateTime: '04/01/2022 - 15:30',
                                movementCategoryColor: incomeColor,
                                movementCategoryName: 'Sirket Harcamalari',
                                movementName: 'Rise Software',
                                movementValue: '-12.000',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AutoSizeText(
                            'Filtre',
                            style: secondryNormalTextStyle,
                            minFontSize: 24,
                          ),
                          CustomDropdownButton2(
                            hint: 'Select Item',
                            dropdownItems: items,
                            value: selectedValue,
                            onChanged: (value) {},
                          ),
                          AutoSizeText(
                            'Tarih',
                            style: secondryNormalTextStyle,
                            minFontSize: 24,
                          ),
                          CustomDropdownButton2(
                            hint: 'Select Item',
                            dropdownItems: items,
                            value: selectedValue,
                            onChanged: (value) {},
                          ),
                          AutoSizeText(
                            'Kategori',
                            style: secondryNormalTextStyle,
                            minFontSize: 24,
                          ),
                          Flexible(
                            child: Container(
                              child: GridView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                itemCount: categories.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: [
                                      Checkbox(
                                        value: false,
                                        checkColor: secondaryLightColor,
                                        focusColor: secondaryLightColor,
                                        onChanged: (value) {},
                                      ),
                                      Expanded(
                                        child: AutoSizeText(
                                          categories[index]['text'],
                                          style: secondryNormalTextStyle,
                                          minFontSize: 14,
                                          overflow: TextOverflow.visible,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    'Fiyat Araligi',
                                    style: secondryNormalTextStyle,
                                    minFontSize: 24,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextFormField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                suffixText: 'TL',
                                                labelText: 'Baslangic',
                                                labelStyle:
                                                    secondryNormalTextStyle,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              )),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Flexible(
                                          child: TextFormField(
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: 'TL',
                                              labelText: 'Bitis',
                                              labelStyle:
                                                  secondryNormalTextStyle,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SfSlider(
                                    min: 0.0,
                                    max: 100.0,
                                    value: 10,
                                    interval: 20,
                                    showTicks: true,
                                    showLabels: true,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    inactiveColor: buttonColor,
                                    activeColor: secondaryLightColor,
                                    onChanged: (dynamic value) {},
                                  ),
                                ],
                              ),
                            ),
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
  }
}
