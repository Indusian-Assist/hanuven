/*
  "photo": "https://res.cloudinary.com/dducewypv/image/upload/v1687802278/Products/qtpig9oskzmvsqgcbbh6.jpg",
      "_id": "6499d1a7f299dfdde8729d3d",
      "name": "shampoo 1",
      "description": "qwertyuijhdsdfgh",
      "price": 80,

 */



// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    String message;
    List<Datum> data;

    Products({
        required this.message,
        required this.data,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String? photo;
    String id;
    String name;
    String description;
    int price;


    Datum({
        this.photo,
        required this.id,
        required this.name,
        required this.description,
        required this.price,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        photo: json["photo"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "photo": photo,
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
    };
}
