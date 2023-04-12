import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String apiUrl = 'http://10.10.0.61/api/login';

  Future<void> login(String emailOrUsername, String password) async {
    try {
      String email = "";
      String username = "";
      if (emailOrUsername.contains("@gmail.com")) {
        email = emailOrUsername;
      } else {
        username = emailOrUsername;
      }
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('user')) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(
              'user_token',
              json.encode(data['user']['name'],
                  toEncodable: (value) => value.toString()));
          prefs.setString(
              'email_token',
              json.encode(data['user']['email'],
                  toEncodable: (value) => value.toString()));
          prefs.setString(
              'id_kantin',
              json.encode(data['user']['id_kantin'],
                  toEncodable: (value) => value.toString()));
          prefs.setString(
              'foto',
              json.encode(data['user']['foto'],
                  toEncodable: (value) => value.toString()));
        } else if (data.containsKey('error')) {
          throw Exception(data['error']);
        } else {
          throw Exception('Gagal login');
        }
      } else {
        throw Exception('Gagal login');
      }
    } catch (e) {
      throw Exception('Gagal login');
    }
  }
}
