
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_clinic/layout/home.dart';
import 'package:touch_clinic/login/cubit/states.dart';
import 'package:touch_clinic/ntework/cache_helper.dart';
import 'package:touch_clinic/register/register_screen.dart';
import '../shared/constants.dart';
import 'cubit/cubit.dart';

class LoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if (state is LoginSuccessState ){
            if(state.loginModel.status == true) {
              CacheHelper.saveData(key:'token', value: state.loginModel.data?.token).then((value) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                } ), (route) => false);
            token = state.loginModel.data?.token;
                Fluttertoast.showToast(
                      msg: state.loginModel.message.toString(),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
            //


              });
            //
            //
            //
            }else {
              Fluttertoast.showToast(
                  msg: state.loginModel.message.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          //
          //
          //
          //
          //
          //      // print(state.loginModel.message);
          //
          }
          // else {
          //   Fluttertoast.showToast(
          //       msg: 'تم تسجيل الدخول بنجاح2',
          //       toastLength: Toast.LENGTH_LONG,
          //       gravity: ToastGravity.BOTTOM,
          //       timeInSecForIosWeb: 5,
          //       backgroundColor: Colors.red,
          //       textColor: Colors.white,
          //       fontSize: 16.0
          //   );
          // }





        },
        builder: (context,state){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                child: SingleChildScrollView(
                  child: Form(
                    // key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.grey[300]),
                                // clipBehavior: Clip.hardEdge,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          'English',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Icon(
                                      Icons.language,
                                      size: 21,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            const Image(
                              image: AssetImage('assets/images/img.png'),
                              height: 40,
                            ),
                            const Spacer(),
                            Container(
                              height: 30,
                              width: 105,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.grey[300]),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context)=> HomeScreen()), (
                                      route) => false);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:  const [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          'استمرار كزائر',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),

                                    Icon(
                                      Icons.keyboard_arrow_left,
                                      size: 23,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Image(image: AssetImage('assets/images/img_2.png')),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'تسجيل الدخول',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan[600]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'الدخول البريد الالكتروني',
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[300]),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'الايميل مطلوب';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
                                style: const TextStyle(height: 0.8),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'اكتب البريد الالكتروني',
                                  hintStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'كلمه المرور',
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[300]),
                              child:
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'الباسورد غير صحيح';
                                  } else {
                                    return null;
                                  }
                                },
                                style: const TextStyle(height: 0.8),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: 'ادخل كلمه المرور',
                                  suffixIcon: const Icon(Icons.visibility),
                                  hintStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child:  Text(
                                      'نسيت كلمه المرور؟',
                                      style: TextStyle(fontSize: 15,color: Colors.cyan[600]),
                                    )),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF00ACC1),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(builder: (context)=> HomeScreen()), );
                                LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                              child: const Text(
                                'تسجيل دخول',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ليس لديك حساب؟',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=> RegisterScreen()),);
                                },
                                child: Text(
                                  'سجل الان',
                                  style:
                                  TextStyle(fontSize: 15, color: Colors.cyan[600],
                                    decoration: TextDecoration.underline,

                                  ),

                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
