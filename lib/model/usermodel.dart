// // class UserApp {
// //   String? title;
// //
// //   UserApp({required this.title});
// //
// //   UserApp.fromJson(Map<String, dynamic> json) {
// //     title = json['name'];
// //   }
// //   Map<String, dynamic> toJson() => {
// //     'title': title,
// //   };
// //
// //
// //
// //
// //
// // }
// // class UserApp {
// //   String? name;
// //
// //   UserApp({this.name});
// //
// //   UserApp.fromJson(Map<String, dynamic> json) {
// //      json['name'] = name;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['name'] = name;
// //     return data;
// //   }
// // }
// class UserModel {
//   String? message;
//   User? user ;
//   bool? status  ;
//
//
//
//   // UserModel({this.message, this.user, this.token,this.status});
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//      user = json['user'] != null ? User.fromJson(json['user']) : null;
//     // user = User.fromJson(json.map(json['data']));
//     status = json['status'];
//
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = <String, dynamic>{};
//   //   data['message'] = message;
//   //   if (user != null) {
//   //     data['user'] = user!.toJson();
//   //   }
//   //   data['token'] = token;
//   //   return data;
//   // }
// }
//
// class User {
//   String? name;
//   String? phone;
//   String? email;
//   String? password;
//   String? city;
//   String? app;
//
//   String? token;
//
//
//   // User(
//   //     {this.name,
//   //       this.phone,
//   //       this.email,
//   //       this.password,
//   //       this.city,
//   //       this.app,
//   //       this.code});
//
//   User.fromJson(Map <String, dynamic> json) {
//     name = json['name'];
//     phone = json['phone'];
//     email = json['email'];
//     password = json['password'];
//     city = json['city'];
//     app = json['app'];
//
//     token = json['token'];
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = <String, dynamic>{};
//   //   data['name'] = name;
//   //   data['phone'] = phone;
//   //   data['email'] = email;
//   //   data['password'] = password;
//   //   data['city'] = city;
//   //   data['app'] = app;
//   //
//   //   return data;
//   // }
// }

class UserData {
  bool? status;
  String? message;
  Data? data;

  UserData({this.status, this.message, this.data});

  UserData.fromJson(Map<String , dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['user'] != null ? Data.fromJson(json['user']) : null;
  }


}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.points,
        this.credit,
        this.token});

  Data.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['points'] = points;
    data['credit'] = credit;
    data['token'] = token;
    return data;
  }
}
