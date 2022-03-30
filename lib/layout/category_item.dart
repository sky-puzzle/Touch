// import 'package:flutter/material.dart';
// import 'package:touch_clinic/model/category_model.dart';
// import 'package:touch_clinic/model/products.dart';
//
// import 'cubit/shop_cubit.dart';
//
// class ProductsCategory extends StatelessWidget {
//   CategoryModel model;
//
//   ProductsCategory(this.model);
//
//   @override
//   Widget build(BuildContext context) {
//     var categorypro = ShopCubit.get(context)
//         .PRODUCTS
//         .where((e) => e.categories!.contains(model.id))
//         .toList();
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           iconTheme: const IconThemeData(color: Color(0xFF00ACC1)),
//           backgroundColor: Colors.grey[200],
//           title: Text(
//             model.title.toString(),
//             style: const TextStyle(color: Colors.black),
//           ),
//         ),
//         body: ListView.separated(
//           shrinkWrap: true,
//           physics: const BouncingScrollPhysics(),
//           itemBuilder: (context, index) =>
//               buildPrdoucts(categorypro[index], context),
//           itemCount: categorypro.length,
//           separatorBuilder: (BuildContext context, int index) =>
//               const Divider(),
//         ),
//       ),
//     );
//   }
//
//   Widget buildPrdoucts(ProductsModel model, context) => InkWell(
//         onTap: () {},
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5.0),
//           child: Card(
//             clipBehavior: Clip.hardEdge,
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   alignment: AlignmentDirectional.topEnd,
//                   children: [
//                     Image(
//                       image: AssetImage(model.imageUrl.toString()),
//                       // fit: BoxFit.cover,
//                       // width: double.infinity,
//                     ),
//                     if (model.discount != null)
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.red,
//                           ),
//                           child: Text(
//                             ' ${model.discount} ',
//                             style: const TextStyle(
//                                 fontSize: 10, color: Colors.white),
//                           ),
//                         ),
//                       )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 10,
//                           ),
//
//                           Row(
//                             children: [
//                               Text('${model.price} ',
//                                   style: const TextStyle(
//                                       fontSize: 15, color: Colors.black)),
//                               const SizedBox(
//                                 width: 1,
//                               ),
//                               const Text('AED',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.black)),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               if (model.discount != null)
//                                 Text(
//                                   '${model.oldPrice} AED',
//                                   style: const TextStyle(
//                                       fontSize: 13,
//                                       color: Colors.grey,
//                                       decoration: TextDecoration.lineThrough,
//                                       decorationColor: Colors.red,
//                                       decorationStyle:
//                                           TextDecorationStyle.double),
//                                 ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 0,
//                           ),
//                           Text(
//                             model.address1.toString(),
//                             style: const TextStyle(fontSize: 17),
//                           ),
//                           Text(
//                             model.address2.toString(),
//                             style: const TextStyle(
//                                 fontSize: 13, color: Colors.grey),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           )
//
//                           // const Spacer(),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
// }
