import 'dart:convert';

import 'package:flutter/services.dart';

Future get(String file) async {
  final response = await rootBundle.loadString("assets/${file}.json");
  final data = await json.decode(response);
  return data;
}

Map chant_select={};