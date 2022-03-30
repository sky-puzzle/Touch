import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/adv.dart';
import 'package:touch_clinic/layout/cubit/shop_cubit.dart';
import 'package:touch_clinic/layout/cubit/shop_states.dart';
import 'package:touch_clinic/layout/pay.dart';
import 'package:touch_clinic/login/login_screen.dart';
import 'package:touch_clinic/model/sections.dart';

import '../ntework/cache_helper.dart';




class HomeScreen extends StatelessWidget {
  List images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                  child: Scaffold(
                 // appBar: AppBar(),
                body: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(
                              height: 40,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/img.png'),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  alignment: AlignmentDirectional.topCenter,
                                  icon: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 4.5,
                                    child: Icon(
                                      Icons.notifications_none_rounded,
                                      size: 28,
                                      color: Color(0xFF00ACC1),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  alignment: AlignmentDirectional.topCenter,
                                  icon: const Icon(
                                    Icons.exit_to_app_outlined,
                                    textDirection: TextDirection.rtl,
                                    size: 28,
                                    color: Color(0xFF00ACC1),
                                  ),
                                  onPressed: () {
                                    singOut(context);
          }




                                ),

                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: CarouselSlider(
                            items: images
                                .map((e) => Image(
                              image: AssetImage(e),
                              width: double.infinity,
                              // height: 400,
                              fit: BoxFit.cover,
                            ))
                                .toList(),
                            options: CarouselOptions(
                              initialPage: 0,
                              viewportFraction: 1,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                              const Duration(seconds: 1),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              autoPlayInterval:
                              const Duration(seconds: 3),
                              height: 200,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListView.builder(
                          itemExtent: 60,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context,index)=> buildItems(ShopCubit.get(context).section[index],context),
                          itemCount: ShopCubit.get(context).section.length,
                        ),

                      ],
                    ),
                  ),
                ])),
              )));
        });
  }

  buildItems(Sections item, BuildContext context) =>
      Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewScreen(item)));
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15
                  ),
                  color: Colors.cyan,
                  border: Border.all(color: Colors.cyan)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Center(
                    child: Text(
                      item.name,
                      style: const TextStyle(fontSize: 20,color: Colors.white),
                      textScaleFactor: 1,
                    ),
                  ),
                  // Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      );


  void singOut(context){
    CacheHelper.removeData(key: 'token').then((value) {
      if(value){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
      }
    });





}}
