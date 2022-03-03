import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addClientCubit/addClient_cubit.dart';
import 'package:budget_app/cubits/addClientCubit/addClient_state.dart';
import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddClientPage extends StatelessWidget {
  const AddClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddClientCubit()..init(),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              height: 75,
              width: double.infinity,
              color: lightColor,
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<AppCubit>().goBackToClientPage();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 32,
                    ),
                    label: AutoSizeText(
                      'Kisi Ekle',
                      minFontSize: 36,
                      style: secondryMediumTextStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<AddClientCubit, AddClientState>(
              builder: (BuildContext context, AddClientState state) {
                if (state is AddClientLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is AddClientLoadedState) {
                  return Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: state.clientContainerColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: AutoSizeText(
                                    state.firstName,
                                    textAlign: TextAlign.center,
                                    style: primaryNormalTextStyle,
                                    minFontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: AutoSizeText(
                                    state.lastName,
                                    textAlign: TextAlign.center,
                                    style: primaryNormalTextStyle,
                                    minFontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Builder(builder: (newContext) {
                                return ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Pick a color!'),
                                            content: SingleChildScrollView(
                                              child: ColorPicker(
                                                pickerColor:
                                                    state.clientContainerColor,
                                                onColorChanged: (Color color) {
                                                  newContext
                                                      .read<AddClientCubit>()
                                                      .changeColorClientPage(
                                                          color);
                                                },
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: AutoSizeText(
                                    'Renk Degistir',
                                    style: secondryNormalTextStyle,
                                    minFontSize: 18,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    primary: buttonColor,
                                  ),
                                );
                              }),
                              const SizedBox(
                                width: 30.0,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: AutoSizeText(
                                  'Icon Degistir',
                                  style: secondryNormalTextStyle,
                                  minFontSize: 18,
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15.0),
                                  primary: buttonColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Flexible(
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: GridView.builder(
                                  itemCount: 10,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 9,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 200,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    List<TextEditingController>
                                        textEditingControllers = [];
                                    return Container(
                                      child: TextFormField(
                                        onChanged: (text) {
                                          if (index == 0) {
                                            context
                                                .read<AddClientCubit>()
                                                .changeFirstName(text);
                                          }
                                          if (index == 2) {
                                            context
                                                .read<AddClientCubit>()
                                                .changeLastName(text);
                                          }
                                        },
                                        decoration: InputDecoration(
                                          label: AutoSizeText(
                                            state.formList[index]['label'],
                                            style: secondryNormalTextStyle,
                                            minFontSize: 18,
                                          ),
                                        ),
                                        controller: state.formList[index]
                                            ['controller'],
                                      ),
                                    );
                                  },
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
