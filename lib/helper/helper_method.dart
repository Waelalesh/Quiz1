import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/services.dart';

class HelperMethod<T> {
  Future<T> readJson(String jsonPath) async {
    final response = await rootBundle.loadString(jsonPath);
    T jsonMap = json.decode(response);
    // Map<String, dynamic> j = _correctJson(jsonMap);
    // print("json ====================== ${j}");
    return Future.value(jsonMap);
  }

  static Map<String, dynamic> _correctJson(Map<String, dynamic> json) {
    Map<String, dynamic> m = <String, dynamic>{};
    json.forEach((key, values) {
      String k = key.replaceAll('_', '');

      m[k.toLowerCase()] = values;

      if (values is Map) {
        m[k.toLowerCase()] = _correctJson(values as Map<String, dynamic>);
      }

      if (values is List) {
        List l = [];

        values.forEach((element) {
          if (element is Map) {
            l.add(_correctJson(element as Map<String, dynamic>));
          }
        });
        m[k.toLowerCase()] = l;
      }
    });
    return m;
  }

  static getCategories() async {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(3).join(' '));
    await Future.delayed(const Duration(seconds: 4));
    return items;
  }

  static getVenues() async {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(2).join(' '));
    await Future.delayed(const Duration(seconds: 4));
    return items;
  }

  static getLanguages() async {
    List items;
    String filePath = "assets/languages.json";
    String jsonString = await rootBundle.loadString(filePath);
    items = await json.decode(jsonString);
    await Future.delayed(const Duration(seconds: 4));
    return items;
  }

  static getUserById(int? id) {
    if (id == null || id < 0) return null;
    Map<String, dynamic> user = {};
    user = {
      "id": id,
      "first_name": faker.person.firstName(),
      "last_name": faker.person.lastName(),
      "about": faker.lorem.words(3).join(' '),
      "image": faker.image.image(),
    };
    return user;
  }
}
