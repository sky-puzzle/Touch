import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/register/register_cubit/register_states.dart';

import '../../model/usermodel.dart';
import '../../ntework/dio_helper.dart';
import '../../ntework/end_point.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);

  String dropval = 'دبي';
  static final menuItem = <String>[
    'دبي',
    'ابوظبي',
    'الشارقة',
    'العين',
    'الفجيرة',
    'عجمان',
  ];
  final List<DropdownMenuItem<String>> drop1 = menuItem
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  void ChangeDrop(value) {
    dropval = value;
    emit(RegisterChangeDrop());
  }

  UserData? loginModel;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String app,
  }) {
    emit(RegisterLoadState());
    DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'app': app,
      'city': dropval,
    }).then((value) {
      print(value.data);

      loginModel = UserData.fromJson(value.data);

      emit(RegisterSuccessState(loginModel!));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }
}
