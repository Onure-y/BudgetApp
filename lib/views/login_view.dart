import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginPageBackgorund.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 75,
              width: size.width,
              child: Center(
                child: AutoSizeText(
                  'Budget App',
                  style: primaryMediumTextStyle,
                  minFontSize: 36,
                ),
              ),
            ),
            Flexible(
              child: Container(
                child: Center(
                  child: Container(
                    width: size.width * .3,
                    height: size.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: bluredBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: AutoSizeText(
                              'Giris Yap',
                              style: primaryNormalTextStyle,
                              minFontSize: 32,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: TextFormField(
                                  cursorColor: primaryDarkColor,
                                  style: primaryNormalTextStyle,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: primaryNormalTextStyle,
                                    filled: true,
                                    fillColor: secondaryDarkColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: TextFormField(
                                  cursorColor: primaryDarkColor,
                                  style: primaryNormalTextStyle,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Sifre',
                                    labelStyle: primaryNormalTextStyle,
                                    filled: true,
                                    fillColor: secondaryDarkColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              'Giris Yap',
                              style: primaryMediumTextStyle,
                              minFontSize: 24,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: secondaryDarkColor,
                              padding: const EdgeInsets.all(15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
