// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'cubit/shop_cubit.dart';
// import 'cubit/shop_states.dart';
//
// class HomeLayOut extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = ShopCubit.get(context);
//     return  BlocConsumer<ShopCubit,ShopStates>(
//       listener: (context,state){},
//       builder: (context,state){
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: Scaffold(
//
//             body: cubit.BottomScreens[cubit.currentIndex],
//             bottomNavigationBar: BottomNavigationBar(
//                backgroundColor: Colors.grey[200],
//               elevation: 10.0,
//               type: BottomNavigationBarType.fixed,
//               unselectedItemColor: Colors.grey,
//               selectedItemColor: Colors.cyan[600],
//               iconSize: 27,
//               currentIndex: cubit.currentIndex,
//               onTap: (index) {
//                 cubit.changeNav(index);
//               },
//               items:  const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                    label: 'الرئيسيه',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.date_range_sharp),
//                    label: 'مواعيدي',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite_outlined),
//                    label: 'المفضله',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.more_horiz_outlined),
//                   label: 'المزيد',
//                 ),
//
//               ],
//             ),
//           ),
//         );
//       },
//
//     );
//   }
// }
