
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/login/login_screen.dart';
import 'package:touch_clinic/register/register_cubit/register_cubit.dart';
import 'package:touch_clinic/register/register_cubit/register_states.dart';
import '../layout/home.dart';
import '../ntework/cache_helper.dart';
import '../shared/constants.dart';

class RegisterScreen extends StatelessWidget {


  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var appController = TextEditingController(text: 'clinic');

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    // var cubit = RegisterCubit.get(context);
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if (state is RegisterSuccessState ){
            if(state.loginModel.status == true) {
              CacheHelper.saveData(key:'token', value: state.loginModel.data?.token).then((value) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                } ), (route) => false);
                token = state.loginModel.data?.token;
                print(state.loginModel.message);
                print(state.loginModel.data?.token);
                //


              });
              //
              //
              //
            }
            //
            //
            //
            //
            //
            //      // print(state.loginModel.message);
            //
          }
      },

        builder: (context,state){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey[200],
                elevation: 0,
                title: const Text(
                  'تسجيل حساب جديد',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.cyan[600],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                     // key: formKey,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'الاسم بالكامل',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300]),
                          child: TextFormField(
                            controller: nameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'الاسم مطلوب';

                              }
                              return null;
                            },
                            style: const TextStyle(height: 0.8),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'مثال اسمه محمد',
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
                          'الايميل',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300]),
                          child: TextFormField(
                              controller: emailController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'الايميل مطلوب';
                                }else{
                                  return null;
                                }
                              },
                            style: const TextStyle(height: 0.8),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'الايميل الالكتروني',
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
                          'رقم الهاتف',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300]),
                          child: TextFormField(
                            controller: phoneController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'الهاتف مطلوب';
                              }else{
                                return null;
                              }
                            },
                            // textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(height: 0.7),
                            keyboardType: TextInputType.phone,
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              prefixIcon: const Image(
                                image: AssetImage(
                                  'assets/images/img_4.png',
                                ),
                                // fit: BoxFit.cover,
                                height: 10,
                                width: 10,
                              ),
                              hintText: '+971 053245215221',
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
                          'المدينة',
                          style: TextStyle(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            // alignment: Alignment.topCenter,
                            // transformAlignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(

                                borderRadius: BorderRadius.circular(20),
                                // isExpanded: true,
                                style: const TextStyle(

                                    fontSize: 13,
                                    color: Colors.black,
                                    wordSpacing: 17,
                                    fontFamily: 'Jannah'),
                                iconSize: 25,
                                alignment: Alignment.center,

                                // isExpanded: false,
                                value: RegisterCubit.get(context).dropval,
                                items: RegisterCubit.get(context).drop1,
                                onChanged: ( val) {
                                  RegisterCubit.get(context).ChangeDrop(val);
                                  // passwordController = val.toString() as TextEditingController;
                                },
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'كلمه المرور',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300]),
                          child: TextFormField(
                            style: const TextStyle(height: 0.8),
                            keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'كلمه المرور مطلوبة';
                                }else{
                                  return null;
                                }
                              },
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.visibility),
                              hintText: 'ادخل كلمه المرور',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF00ACC1),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                // if(formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                     email: emailController.text,
                                     password: passwordController.text,
                                     name: nameController.text,
                                     phone: phoneController.text,
                                     app: appController.text



                                 );
                                // }


                              },
                              child: const Text(
                                'تسجيل',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'التسجيل في Touch يعني انك موافق علي',
                                    style: TextStyle(fontSize: 13, color: Colors.grey),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'الشروط والاحكام',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13,
                                            decoration: TextDecoration.underline),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )
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
