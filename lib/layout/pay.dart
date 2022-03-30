import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/favorites.dart';
import 'package:touch_clinic/model/sections.dart';


import 'cubit/shop_cubit.dart';
import 'cubit/shop_states.dart';


class PayScreen extends StatefulWidget {




  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  bool _value = true;
  bool _value1 = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.grey[200],
                    centerTitle: true,
                    title: const Text(
                      'طرق الدفع',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.cyan[600],
                        )),
                  ),
                  body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _value = !_value;
                                    _value1 = false;
                                  });
                                },
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.cyan[100],
                                    border: Border.all(
                                      color: _value ? Colors.blue :  const Color(0xFFEEEEEE),
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [

                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _value = !_value;
                                              _value1 = false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey, ),
                                                color: Colors.white),
                                            child: _value
                                                ? const Icon(
                                                    Icons.circle,
                                                    size: 20.0,
                                                    color: Colors.cyan,
                                                  )
                                                : const Icon(
                                                    Icons.check_box_outline_blank,
                                                    size: 20.0,
                                                    color: Colors.white,
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),

                                        const Text('الدفع باستخدام الفيزا',style: TextStyle(fontSize: 14),textScaleFactor: 1,),
                                        const Spacer(),
                                        const Icon(Icons.credit_card,size: 30,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _value1  =! _value1;
                                    _value = false;
                                  });
                                },
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.cyan[100],
                                    border: Border.all(
                                      color: _value1 ? Colors.blue :  const Color(0xFFEEEEEE),
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [

                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _value1 = !_value1;
                                              _value = false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey, ),
                                                color: Colors.white),
                                            child: _value1
                                                ? const Icon(
                                                    Icons.circle,
                                                    size: 20.0,
                                                    color: Colors.cyan,
                                                  )
                                                : const Icon(
                                                    Icons.check_box_outline_blank,
                                                    size: 20.0,
                                                    color: Colors.white,
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),

                                        const Text('الدفع كاش',style: TextStyle(fontSize: 14),textScaleFactor: 1,),
                                        const Spacer(),
                                        const Icon(Icons.money,size: 30,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Contract()));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue),
                                      child: const Center(
                                        child: Text(
                                          'تأكيد الدفع',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.white),
                                          textScaleFactor: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
//
// class AlerttDailog extends StatefulWidget {
//   @override
//   _AlertDailogState createState() => _AlertDailogState();
// }
//
// class _AlertDailogState extends State<AlerttDailog> {
//   bool val = false;
//   bool val1 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       actions: [
//         Checkbox(
//             value: val,
//             onChanged: (value) {
//               setState(() {
//                 value = val;
//               });
//             }),
//         Checkbox(
//             value: val1,
//             onChanged: (value) {
//               setState(() {
//                 value = val1;
//               });
//             }),
//       ],
//     );
//   }
// }
