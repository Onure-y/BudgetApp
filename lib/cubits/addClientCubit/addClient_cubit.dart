import 'package:bloc/bloc.dart';
import 'package:budget_app/constant.dart';
import 'package:budget_app/cubits/addClientCubit/addClient_state.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';

class AddClientCubit extends Cubit<AddClientState> {
  AddClientCubit({required this.userRepository})
      : super(AddClientInitialState()) {
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

  final UserRepository userRepository;

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
  int iconIndex = 8;

  void init() {
    emit(
      AddClientLoadedState(
        formList: formList,
        firstName: firstName,
        lastName: lastName,
        clientContainerColor: clientContainerColor,
        iconIndex: iconIndex,
      ),
    );
  }

  void changeIcon(int index) {
    iconIndex = index;
    emit(
      AddClientLoadedState(
        formList: formList,
        firstName: firstName,
        lastName: lastName,
        clientContainerColor: clientContainerColor,
        iconIndex: iconIndex,
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
        iconIndex: iconIndex,
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
        iconIndex: iconIndex,
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
        iconIndex: iconIndex,
      ),
    );
  }

  Future createNewClient() async {
    CustomerModel newCustomerData = CustomerModel(
      firstName: formList[0]['controller'].text,
      email: formList[1]['controller'].text,
      lastName: formList[2]['controller'].text,
      web: formList[3]['controller'].text,
      companyName: formList[4]['controller'].text,
      city: formList[5]['controller'].text,
      telephoneNumber1: formList[6]['controller'].text,
      address: formList[7]['controller'].text,
      telephoneNumber2: formList[8]['controller'].text,
      details: formList[9]['controller'].text,
      containerColor:
          clientContainerColor.value.toRadixString(16).substring(2, 8),
      customerIconIndex: iconIndex,
    );
    await userRepository.createNewClient(customerModel: newCustomerData);
  }
}
