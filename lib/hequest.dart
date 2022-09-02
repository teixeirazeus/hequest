// Copyright 2021 DevHops. All rights reserved.
library hequest;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Hequest {
  /// The base URL for the API.
  String baseUrl;

  Hequest({
    required this.baseUrl,
  });

  /// GET request
  Future<Response> get(String route) async {
    return await http.get(Uri.parse(baseUrl + route));
  }

  /// GET request with token authentication
  Future<Response> getWithToken(String route, String token) async {
    return await http.get(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
  }

  /// POST request
  Future<Response> post(String route, Map<dynamic, dynamic> jsonMap) async {
    return await http.post(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(jsonMap),
    );
  }

  /// POST request with token authentication
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

  /// PUT request
  Future<Response> put(String route, Map<dynamic, dynamic> jsonMap) async {
    return await http.put(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(jsonMap),
    );
  }

  /// PUT request with token authentication
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

  /// DELETE request with token authentication
  Future<Response> deleteWithToken(String route, String token) async {
    return await http.delete(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
  }

  /// DELETE request
  Future<Response> delete(String route) async {
    return await http.delete(Uri.parse(baseUrl + route));
  }

  /// DELETE request with token authentication and body
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
