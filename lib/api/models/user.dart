// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';
import '../services/base_client.dart';


UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    LoginInfo loginInfo;
    String id;
    int phone;
    String role;
    List<dynamic> cart;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String address;
    String email;
    String name;

    UserData({
        required this.loginInfo,
        required this.id,
        required this.phone,
        required this.role,
        required this.cart,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.address,
        required this.email,
        required this.name,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        loginInfo: LoginInfo.fromJson(json["loginInfo"]),
        id: json["_id"],
        phone: json["phone"],
        role: json["role"],
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        address: json["address"],
        email: json["email"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "loginInfo": loginInfo.toJson(),
        "_id": id,
        "phone": phone,
        "role": role,
        "cart": List<dynamic>.from(cart.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "address": address,
        "email": email,
        "name": name,
    };
}

class LoginInfo {
    String ip;
    String device;
    String header;
    DateTime date;

    LoginInfo({
        required this.ip,
        required this.device,
        required this.header,
        required this.date,
    });

    factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
        ip: json["ip"],
        device: json["device"],
        header: json["header"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "ip": ip,
        "device": device,
        "header": header,
        "date": date.toIso8601String(),
    };
}


Future<dynamic> fetchUserData() async {
    return userDataFromJson(await BaseClient().get('https://hanuven.vercel.app', '/api/auth/session'));
  }