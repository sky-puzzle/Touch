import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_clinic/layout/pay.dart';
import 'package:touch_clinic/model/sections.dart';
import 'package:touch_clinic/shared/constants.dart';

import 'package:touch_clinic/shared/upload.dart';

import 'cubit/shop_cubit.dart';
import 'cubit/shop_states.dart';

class NewScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var timeController = TextEditingController();
  var bodyController = TextEditingController();
  Sections item;

  NewScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is SuccessUploadingStates) {
        if (state.uploadAds!.code == 200) {
          Fluttertoast.showToast(
              msg: '${state.uploadAds!.message}',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PayScreen()));
          print(state.uploadAds!.code == 200);
        } else {
          Fluttertoast.showToast(
              msg: '${state.uploadAds!.message}',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }, builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[200],
              centerTitle: true,
              title: Text(
                item.name,
                style: const TextStyle(fontSize: 15, color: Colors.black),
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
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'تحميل صوره الاعلان',
                                style: TextStyle(fontSize: 14),
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                          Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(color: Colors.grey[300]
                                  // border: Border.all(
                                  //     color: const Color(0xFF616161), width: 2)
                                  ),
                              child: IconButton(
                                onPressed: () {
                                  ShopCubit.get(context).pickImage();
                                },
                                icon: const Icon(Icons.upload_rounded),
                              )),
                          if (ShopCubit.get(context).imageFile == null ||
                             ( ShopCubit.get(context).imageFile != null &&ShopCubit.get(context).imageFile!.lengthSync() /
                                      (1024 * 1024) > 2))
                            // if(state is UploadImageStates)
                            const Placeholder(
                              fallbackHeight: 40,
                              fallbackWidth: 40,
                            )
                          else
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.file(
                                    ShopCubit.get(context).imageFile!))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 250,
                              child: MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(textScaleFactor: 1),
                                child: TextFormField(
                                  controller: timeController,
                                  style: const TextStyle(
                                      height: 0.8, fontSize: 14),
                                  keyboardType: TextInputType.datetime,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' مدة الاعلان مطلوبة';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    label: Text(
                                      'مدة الاعلان',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 250,
                              child: MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(textScaleFactor: 1),
                                child: TextFormField(
                                  controller: bodyController,
                                  style: const TextStyle(
                                      height: 0.8, fontSize: 14),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' سياسة الاعلان مطلوبة';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    label: Text(
                                      'سياسة الاعلان',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await ShopCubit.get(context).uploadImage(
                                  timeController.text,
                                  bodyController.text,
                                  token!);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>PayScreen()));
                            }
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.cyan),
                              child: const Center(
                                child: Text(
                                  'تأكيد',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  textScaleFactor: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
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
