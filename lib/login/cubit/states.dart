



import '../../model/usermodel.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final UserData loginModel;

 LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates{
  final String error;

  LoginErrorState(this.error);
}
class ChangePasswordState extends LoginStates{}
