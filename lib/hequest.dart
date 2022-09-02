// Copyright 2021 DevHops. All rights reserved.
library hequest;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Hequest {
  String baseUrl;
  Hequest({
    required this.baseUrl,
  });

  Future<Response> get(String route) async {
    return await http.get(Uri.parse(baseUrl + route));
  }

  Future<Response> getWithToken(String route, String token) async {
    return await http.get(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<Response> post(String route, Map<dynamic, dynamic> jsonMap) async {
    return await http.post(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(jsonMap),
    );
  }

  Future<Response> postWithToken(
      String route, String token, Map<dynamic, dynamic> jsonMap) async {
    return await http.post(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(jsonMap),
    );
  }

  Future<Response> put(String route, Map<dynamic, dynamic> jsonMap) async {
    return await http.put(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(jsonMap),
    );
  }

  Future<Response> putWithToken(
      String route, String token, Map<dynamic, dynamic> jsonMap) async {
    return await http.put(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(jsonMap),
    );
  }

  Future<Response> deleteWithToken(String route, String token) async {
    return await http.delete(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<Response> delete(String route) async {
    return await http.delete(Uri.parse(baseUrl + route));
  }

  Future<Response> deleteWithTokenNBody(
      String route, String token, Map<String, dynamic> jsonMap) async {
    return await http.delete(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(jsonMap),
    );
  }
}
