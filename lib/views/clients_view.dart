import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            height: 75,
            width: double.infinity,
            color: lightColor,
            child: AutoSizeText(
              'Kisiler',
              minFontSize: 36,
              style: secondryMediumTextStyle,
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Flexible(
                    child: Container(
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 40,
                          crossAxisSpacing: 50,
                          childAspectRatio: 1,
                        ),
                        children: List.generate(
                          7,
                          (index) {
                            if (index == 6) {
                              return InkWell(
                                onTap: () {},
                                child: DottedBorder(
                                  color: Colors.black,
                                  strokeWidth: 1,
                                  dashPattern: const [5, 5],
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(20.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DottedBorder(
                                          child: const Icon(
                                            Icons.add,
                                            size: 64,
                                          ),
                                          strokeWidth: 1,
                                          dashPattern: const [5, 5],
                                          borderType: BorderType.Circle,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText(
                                          'Kisi Ekle',
                                          style: secondryNormalTextStyle,
                                          minFontSize: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: incomeColor,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 64,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText('Rise Software',
                                            style: primaryNormalTextStyle,
                                            minFontSize: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
