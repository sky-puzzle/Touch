class UploadAds {
  String? message;
  int? code;


  UploadAds({this.message, this.code, });

  UploadAds.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];

  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['time'] = time;
  //   data['body'] = this.body;
  //   data['img'] = img;
  //   data['token'] = this.token;
  //   return data;
  // }
}
