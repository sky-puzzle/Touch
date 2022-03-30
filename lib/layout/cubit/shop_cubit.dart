import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:touch_clinic/layout/cubit/shop_states.dart';
import 'package:touch_clinic/model/ads.dart';
import 'package:touch_clinic/model/sections.dart';
import 'package:touch_clinic/model/usermodel.dart';
import 'package:touch_clinic/ntework/dio_helper.dart';
import 'package:touch_clinic/ntework/end_point.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_downloader/image_downloader.dart';

import '../../shared/constants.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStates());

  static ShopCubit get(context) => BlocProvider.of(context);
  final bool _value = true;
  final bool _value1 = false;

  void check1(value) {
    value = _value;
    emit(state);
  }

  void check2(value) {
    value = _value1;
    emit(state);
  }

  List<Sections> section = [
    Sections(id: 1, name: 'اعلان شهر'),
    Sections(id: 2, name: 'اعلان 3 اشهر'),
    Sections(id: 3, name: 'اعلان 6 اشهر'),
    Sections(id: 4, name: 'اعلان سنة'),
  ];

  File? imageFile;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      imageFile = File(pickFile.path);

    }

    double size  = imageFile!.lengthSync() /(1024*1024);

    if(size > 2){
      Fluttertoast.showToast(
          msg: 'image > 2 mega Byt',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(UploadErrorImageStates());
    } else {
      emit(UploadImageStates());
    }
  }
 UploadAds? uploadAds;

  Future uploadContract() async {
    String fileName = imageFile!.path.split('/').last;

    FormData formData = FormData.fromMap({
      'token': token,
      'contract': await MultipartFile.fromFile(
        imageFile!.path,
        filename: fileName,
         contentType: MediaType("image", "jpeg",),
      ),
    });
    emit(LoadingUploadContractStates());
    await DioHelper.postData(url: CONTRACT, data: formData).then((value) {
      emit(SuccessUploadContractStates());
      // print(value.data);
    }).catchError((error) {
      emit(ErrorUploadContractStates(error.toString()));
      print(error.toString());
    });
    print(token);
  }

  Future  uploadImage(
       String time, String body, String token
      ) async {
     if (imageFile == null) return;
      // print(imageFile.);
    String fileName = imageFile!.path.split('/').last;
    FormData formData = FormData.fromMap({
      'time':time,
      'body':body,
      'token':token,
    //
      'img': await MultipartFile.fromFile(
        imageFile!.path,
        filename: fileName,
         // contentType: MediaType("image", 'jpeg'),
      ),
    });
    emit(LoadingUploadingStates());
     await   DioHelper.postData(url: ADS, data: formData).then((value) {
       print("success");

         uploadAds = UploadAds.fromJson(value.data);

         print(value.toString());
          emit(SuccessUploadingStates(uploadAds!));
       }).catchError((error){
         emit(ErrorUploadingStates(error.toString()));
         print(error.toString());
       });



      // print(value.data);
    // }).catchError((error) {
    //   emit(ErrorUploadingStates(error.toString()));
    //   print(error.toString());
    // });
  }



  // void sendData(String time, String body, String token) {
  //   emit(LoadingAdsStates());
  //   DioHelper.postData(
  //     url: ADS,
  //     data: {'time': time, 'body': body, 'token': token,},
  //   ).then((value) {
  //     uploadAds = UploadAds.fromJson(value.data);
  //     // uploadImage();
  //     emit(SuccessAdsStates());
  //      print(value.data);
  //   }).catchError((error) {
  //     emit(ErrorAdsStates(error.toString()));
  //     print(error.toString());
  //   });
  //   // uploadImage();
  // }




  void sendContractData( String token) {
    emit(LoadingContractStates());
    DioHelper.postData(
      url: CONTRACT,
      data: { 'token': token,

      },
    ).then((value) {
      emit(SuccessContractStates());
      print(value.data);
    }).catchError((error) {
      emit(ErrorContractStates(error.toString()));
      print(error.toString());
    });
  }

  // Future downLoad() async{
  //   // String fileName = DOWNLOAD.substring(DOWNLOAD.lastIndexOf("/") + 1);
  //  // final savePath = await getFilePath();
  //
  //    final downloadDir = await getApplicationSupportDirectory();
  //    final file = File('${downloadDir.path}/contract.jpg');
  //    // String saveFilePath = '${downloadDir.path}/contract.jpg';
  //   emit(LoadingDownLoadStates());
  //
  //  var response = Dio().download(DOWNLOAD, file);
  //    final raf = file.openSync(
  //        mode: FileMode.write
  //    );
  //    raf.writeByteSync(response.);
  //    await raf.close();
  //    return file;
  //
  //
  //  // await DioHelper.getDownLoad(
  //  //      url: DOWNLOAD,
  //  //    savePath:saveFilePath
  //  //  ).then((value) {
  //  //    print(value);
  //  //    emit(SuccessDownLoadStates());
  //  //  }).catchError(onError);
  //  //  emit(ErrorDownLoadStates());
  // }

  Future openFile() async {
    final file = await downloadFile();
    if (file == null) return;
    print('${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile() async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/contract.jpg');

    final response = await Dio().get(DOWNLOAD,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ));
    final raf = file.openSync(mode: FileMode.write);
    raf.writeByteSync(response.data);
    await raf.close();
    return file;
  }

  void down1() async {
    // final appStorage = await getApplicationDocumentsDirectory();
    // // final file = File('${appStorage.path}/contract.jpg');
    // await ImageDownloader.downloadImage(DOWNLOAD,
    //     destination: AndroidDestinationType.custom(directory: '/contract.jpg'));
    try {
      var imageId = await ImageDownloader.downloadImage(DOWNLOAD,);
      if(imageId != null){
        Fluttertoast.showToast(
            msg: 'تم التحميل بنجاح',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
      if (imageId == null) {
        return;
      }
      // var path = await ImageDownloader.findPath(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
  Future download2() async {
    try {
       final appStorage = await getApplicationDocumentsDirectory();
       // String path = appStorage.path '/dummy.pdf' ;
       String path ='${appStorage.path}+/dummy.pdf' ;

    await DioHelper.getDownLoad(url: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',savePath: path);
    print (path);

      File file = File('${appStorage.path}/contract.jpg');
      // var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      // raf.writeFromSync(response.data);
      // await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }


}
