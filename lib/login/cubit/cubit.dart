import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/login/cubit/states.dart';

import '../../model/usermodel.dart';
import '../../ntework/dio_helper.dart';
import '../../ntework/end_point.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserData? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
     emit(LoginLoadState());
    DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email': email,
          'password': password
        }
          )
        .then((value) {

           print(value.data);
      loginModel = UserData.fromJson(value.data);


      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  bool obscureText = true;
  IconData suffix = Icons.visibility_outlined;

  void changePassword() {
    obscureText = !obscureText;
    suffix =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordState());
  }
}
