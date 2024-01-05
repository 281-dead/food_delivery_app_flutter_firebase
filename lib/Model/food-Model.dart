import 'package:flutter/material.dart';

class FoodModel {
  String? name;
  int? price;
  String? image;
  String? category;
  String? description;

  FoodModel({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
    image = json["image"];
    category = json["category"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["price"] = price;
    data["image"] = image;
    data["category"] = category;
    data["description"] = description;
    return data;
  }
}
