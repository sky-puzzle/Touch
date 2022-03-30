


import '../../model/usermodel.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterChangeDrop extends RegisterStates {}
class RegisterLoadState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  final UserData loginModel;

  RegisterSuccessState(this.loginModel);
}
class RegisterErrorState extends RegisterStates{
  final String Error;

  RegisterErrorState(this.Error);
}
class ChangePasswordState extends RegisterStates{}


