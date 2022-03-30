import 'package:dio/dio.dart';

import '../shared/constants.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      // baseUrl: 'https://student.valuxapps.com/api/',
         baseUrl: 'http://touch.extra-laboratory.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type':'application/json',
        "Authorization": "Bearer $token",
      }

    ));
  }

  static Future<Response> getData(
      {
        required String url,
         Map<String, dynamic>? query,
        String lang = 'en',
        String? token,
      }
        )async
   {
     dio.options.headers =
     {
       'lang':lang,
        'Authorization':token??'',
       // 'Content-Type':'application/json'
     };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }



  static Future <Response> postData( {
  required String url,
  required  data,
     String lang = 'en',
    String? token ,

})
   async {

    dio.options.headers =
    {
      // 'lang':lang,
      'Authorization':token??'',
        'Content-Type':'application/x-www-form-urlencoded'
    };
    return  await dio.post(url,data: data);

  }


  static Future<Response> getDownLoad( {
    required String url,
    String? savePath,
    // String lang = 'en',
    // String? token ,

  })
   {

    dio.options.headers =
    {
      // 'lang':lang,
      'Authorization':token,
      'Content-Type':'application/x-www-form-urlencoded'
    };
    return   dio.download(url, savePath);

  }
}
