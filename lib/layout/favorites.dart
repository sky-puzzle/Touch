import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:touch_clinic/layout/home.dart';
import 'package:touch_clinic/ntework/end_point.dart';
import 'package:touch_clinic/shared/upload.dart';

import '../shared/constants.dart';
import 'cubit/shop_cubit.dart';
import 'cubit/shop_states.dart';


class Contract extends StatelessWidget {
  @override

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
                      'العقد',
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
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'يرجي تحميل العقد ادناه ثم التوقيع عليه',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  textScaleFactor: 1,
                                ),
                                Text(
                                  ' ثم رفعه مره اخري الينا',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'تحميل العقد',
                            style: TextStyle(fontSize: 14),
                            textScaleFactor: 1,
                          ),
                          const Spacer(),
                          ConditionalBuilder(
                              condition: true,
                              builder: (context)=>  Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey[400],
                                child:
                                IconButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                        msg: 'جاري تحميل العقد',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );

                                    // Dio dio = Dio();
                                    // var dir = await getExternalStorageDirectory();
                                    //  dio.download(DOWNLOAD, '${dir!.path}/contract.png');
                                    ShopCubit.get(context).down1();
                                    // ShopCubit.get(context).down1();
                                  },
                                  icon: const Icon(Icons.cloud_download_outlined),
                                ),
                              ),
                              fallback: (contetx)=> CircularProgressIndicator()
                          )

                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'رفع العقد بعد توقيعه',
                            style: TextStyle(fontSize: 14),
                            textScaleFactor: 1,
                          ),
                          Spacer(),
                          Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey[400],
                              child:IconButton(
                                onPressed: ()async{
                                  await  ShopCubit.get(context). pickImage();
                                  // ShopCubit.get(context).uploadImage();
                                },
                                icon: const Icon(Icons.upload_rounded),
                              )),
                          // if(ShopCubit.get(context).imageFile == null)
                          //   const Placeholder(fallbackHeight: 40,
                          //     fallbackWidth: 40,
                          //   )
                          // else
                          //   SizedBox(width: 100,height: 100,
                          //       child: Image.file(ShopCubit.get(context).imageFile!))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Center(
                        child: InkWell(
                          onTap: () {

                            ShopCubit.get(context).uploadContract();

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlerttDailog();
                                });
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
                                  'تأكيد',
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
              ));
        });
  }
}

class AlerttDailog extends StatefulWidget {
  @override
  _AlertDailogState createState() => _AlertDailogState();
}

class _AlertDailogState extends State<AlerttDailog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
      Colors.black
          .withOpacity(
          0.7),
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(
              Radius.circular(
                  20))),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const Text(
            'سوف يتم مراجعة طلبك',
            style: TextStyle(fontSize: 14, color: Colors.green),
            textScaleFactor: 1,
          ),
          Text(
            'والاتصال بك في اقرب وقت',
            style: TextStyle(fontSize: 14, color: Colors.green),
            textScaleFactor: 1,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.deepOrange),
                child: const Center(
                  child: Text(
                    'متابعة',
                    style: TextStyle(
                        fontSize: 14, color: Colors.white),
                    textScaleFactor: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
