library hequest;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Hequest {
  /// The base URL for the API.
  /// Example: https://api.example.com
  String baseUrl;

  /// Hequest constructor.
  Hequest({
    required this.baseUrl,
  });

  /// GET request
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// Returns a [Response] object.
  Future<Response> get(String route) async {
    return await http.get(Uri.parse(baseUrl + route));
  }

  /// GET request with token authentication
  ///
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [token] is the token to authenticate the request.
  /// Returns a [Response] object.
  Future<Response> getWithToken(String route, String token) async {
    return await http.get(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
  }

  /// POST request
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [jsonMap] is the JSON map to send in the request body.
  /// Returns a [Response] object.
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
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [token] is the token to authenticate the request.
  /// [jsonMap] is the JSON map to send in the request body.
  /// Returns a [Response] object.
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
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [jsonMap] is the JSON map to send in the request body.
  /// Returns a [Response] object.
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
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [token] is the token to authenticate the request.
  /// [jsonMap] is the JSON map to send in the request body.
  /// Returns a [Response] object.
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

  /// PATCH request
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [jsonMap] is the JSON map to send in the request body.
  /// Returns a [Response] object.
  Future<Response> patch(String route, Map<dynamic, dynamic> jsonMap) async {
    return await http.patch(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(jsonMap),
    );
  }

  /// PATCH request with token authentication
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [token] is the token to authenticate the request.
  /// [jsonMap] is the JSON map to send in the request body.
  /// Returns a [Response] object.
  Future<Response> patchWithToken(
      String route, String token, Map<dynamic, dynamic> jsonMap) async {
    return await http.patch(
      Uri.parse(baseUrl + route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(jsonMap),
    );
  }

  /// DELETE request with token authentication
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [token] is the token to authenticate the request.
  /// Returns a [Response] object.
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
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// Returns a [Response] object.
  Future<Response> delete(String route) async {
    return await http.delete(Uri.parse(baseUrl + route));
  }

  /// DELETE request with token authentication and body
  ///
  /// [route] is the route to the endpoint.
  /// Example: /users
  /// [token] is the token to authenticate the request.
  /// [jsonMap] is the JSON map to send in the request body.
  /// Returns a [Response] object.
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
