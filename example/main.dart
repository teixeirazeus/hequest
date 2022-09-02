import 'dart:convert';

import 'package:hequest/hequest.dart';

class GithubApi {
  final Hequest _hequest;

  GithubApi(this._hequest);

  Future<Map> getUser(String username) async {
    try {
      final response = await _hequest.get('/users/$username');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        return throw Exception('User not found');
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Error getting user');
    }
  }
}

void main() async {
  final hequest = Hequest(baseUrl: 'https://api.github.com');
  final githubApi = GithubApi(hequest);

  final user = await githubApi.getUser('teixeirazeus');
  // ignore: avoid_print
  print(user.toString());
}
