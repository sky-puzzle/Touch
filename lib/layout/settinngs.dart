import 'package:flutter/material.dart';
import 'package:touch_clinic/login/login_screen.dart';

class SettingsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30,left: 10,right: 15),
                child: Text('المزيد',style: TextStyle(fontSize: 20),),
              ),
               SizedBox(height: 20,),
              Card(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Icon(Icons.person_outline_rounded),
                        SizedBox(width: 15,),
                        Text('حسابي',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Icon(Icons.settings_outlined),
                        SizedBox(width: 15,),
                        Text('الاعدادات',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Icon(Icons.info_outline),
                        SizedBox(width: 15,),
                        Text('المساعده',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Icon(Icons.share_rounded),
                        SizedBox(width: 15,),
                        Text('مشاركه التطبيق',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),

               SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,

                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)
                    // color: Colors.white,
                  ),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginScreen()),
                              );
                      },
                      child: Center(
                        child: Text(
                          'تسجيل خروج',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700]),
                        ),
                      )),

                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
