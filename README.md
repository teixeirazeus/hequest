![banner](https://raw.githubusercontent.com/teixeirazeus/hequest/master/readme_assets/banner.png)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/ca9452a2e4a745718e59fc8ca54de6e2)](https://www.codacy.com/gh/teixeirazeus/hequest/dashboard?utm_source=github.com\&utm_medium=referral\&utm_content=teixeirazeus/hequest\&utm_campaign=Badge_Grade)[![License](https://raw.githubusercontent.com/teixeirazeus/hequest/3bb5c5adb73020d036563be2a155210562789f22/readme_assets/mit.svg)](https://github.com/teixeirazeus/hequest)

Simple and hackable request for dart.

## Installing

1.  Add dependencies to `pubspec.yaml`

    ```yaml
    dependencies:
        hequest:
            git:
                url: https://github.com/teixeirazeus/hequest
    ```

2.  Run pub get.

    ```shell
    flutter pub get
    ```

3.  Import package.

    ```dart
    import 'package:hequest/hequest.dart';
    ```

## Using

Hequest was created with simplicity in mind to handle multiple API requests.

You start by declaring an object of type `Hequest` and passing the `baseUrl` of your api.

```dart
final githubApi = Hequest(baseUrl: 'https://api.github.com');
```

### GET

```dart
final response = await githubApi.get('/users/teixeirazeus');
```

### POST

```dart
final response = await githubApi.post('/users/teixeirazeus', body: {
    'name': 'Zeus Teixeira',
    });
```

### PUT

```dart
final response = await githubApi.put('/users/teixeirazeus', body: {
    'name': 'Zeus Teixeira',
    });
```

### DELETE

```dart
final response = await githubApi.delete('/users/teixeirazeus');
```

### JWT

All requests support sending jwt token.

To use to use the `WithToken` postfix and pass the token as a parameter.

```dart
final response = await githubApi.getWithToken('/users/teixeirazeus', token);
```

### Tips

It is highly recommended that you use `try catch` to handle errors. Along with a larger abstraction with a class for each endpoint of your api.

```dart
class GithubApi {
  final Hequest _hequest;

  GithubApi(this._hequest);

  Future<Map> getUser(String username) async {
    try {
      final response = await _hequest.get('/users/$username');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception('User not found');
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Error getting user');
    }
  }
}
```

```dart
final hequest = Hequest(baseUrl: 'https://api.github.com');
final githubApi = GithubApi(hequest);

final user = await githubApi.getUser('teixeirazeus');
print(user.toString());
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
