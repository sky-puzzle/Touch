import 'package:flutter/material.dart';
import 'package:touch_clinic/login/login_screen.dart';


import '../ntework/cache_helper.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  void submit( context){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=> LoginScreen()), (
            route) => false);


      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 50,
                  ),
                  const Image(
                    height: 35,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/img.png'),
                  )
                ],
              ),
              // const SizedBox(height: 10,),
              const Expanded(
                  child: Image(image: AssetImage('assets/images/img_1.png'))),
              // const SizedBox(
              //   height: 10,
              // ),
              const Text(
                'عروض وخصومات علي العيادات والمراكز الطبيه',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF00ACC1),
                ),
                child: MaterialButton(
                    onPressed: () {
                      submit(context);
                    },
                    child: const Text(
                      'استمرار',
                      style: TextStyle(fontSize: 18, color: Colors.white),textScaleFactor: 1,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
