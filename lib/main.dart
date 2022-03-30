import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/cubit/shop_cubit.dart';
import 'package:touch_clinic/layout/home.dart';

import 'package:touch_clinic/login/login_screen.dart';
import 'package:touch_clinic/ntework/cache_helper.dart';
import 'package:touch_clinic/register/register_screen.dart';
import 'package:touch_clinic/shared/block.dart';
import 'package:touch_clinic/shared/constants.dart';

import 'layout/pay.dart';
import 'layout/favorites.dart';
import 'layout/adv.dart';
import 'layout/section1.dart';

import 'on_boarding/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  Widget widget;
  dynamic onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);
  if (onBoarding != null) {
    if (token != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoarding();
  }
  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
   MyApp(this.startWidget);
  final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Jannah',
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: Builder(builder: (BuildContext context) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1
          ), child: startWidget);
        },

        )
      ),
    );
  }
}
