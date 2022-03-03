import 'package:bloc/bloc.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addClientCubit/addClient_state.dart';
import 'package:flutter/cupertino.dart';

class AddClientCubit extends Cubit<AddClientState> {
  AddClientCubit() : super(AddClientInitialState()) {
    emit(AddClientLoadingState());

    formList = [
      {'label': 'Ad', 'controller': nameTextController},
      {'label': 'Email', 'controller': emailTextController},
      {'label': 'Soyad', 'controller': lastNameTextController},
      {'label': 'Web', 'controller': webAddressTextController},
      {'label': 'Firma Adi', 'controller': companyTextController},
      {'label': 'Sehir', 'controller': cityTextController},
      {'label': 'Telefon No-1', 'controller': telephoneNumber1Controller},
      {'label': 'Adres', 'controller': addressTextController},
      {'label': 'Telefon No-2', 'controller': telephoneNumber2Controller},
      {'label': 'Aciklama', 'controller': detailTextController},
    ];
  }

  List<Map<String, dynamic>> formList = [];

  TextEditingController nameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController companyTextController = TextEditingController();
  TextEditingController telephoneNumber1Controller = TextEditingController();
  TextEditingController telephoneNumber2Controller = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController webAddressTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController detailTextController = TextEditingController();

  String firstName = 'Ad';
  String lastName = 'Soyad';
  Color clientContainerColor = incomeColor;

  void init() {
    emit(
      AddClientLoadedState(
        formList: formList,
        firstName: firstName,
        lastName: lastName,
        clientContainerColor: clientContainerColor,
      ),
    );
  }

  void changeColorClientPage(Color color) {
    clientContainerColor = color;
    emit(
      AddClientLoadedState(
        formList: formList,
        firstName: firstName,
        lastName: lastName,
        clientContainerColor: clientContainerColor,
      ),
    );
  }

  void changeFirstName(String text) {
    firstName = text;
    emit(
      AddClientLoadedState(
        formList: formList,
        firstName: text,
        lastName: lastName,
        clientContainerColor: clientContainerColor,
      ),
    );
  }

  void changeLastName(String text) {
    lastName = text;
    emit(
      AddClientLoadedState(
        formList: formList,
        firstName: firstName,
        lastName: text,
        clientContainerColor: clientContainerColor,
      ),
    );
  }
}
