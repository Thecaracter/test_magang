import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://172.29.128.1/test_magang/register.php';

  static Future<Map<String, dynamic>> register(
      String username, String password, String notelp, String alamat) async {
    final response = await http.post(Uri.parse('$baseUrl/register'), body: {
      'username': username,
      'password': password,
      'notelp': notelp,
      'alamat': alamat,
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user.');
    }
  }
}

class LoginService {
  static Future<http.Response> login(String username, String password) async {
    final apiUrl =
        'http://172.29.128.1/test_magang/login.php'; // sesuaikan dengan URL API login di server Anda

    final response = await http.post(Uri.parse(apiUrl),
        body: {'username': username, 'password': password});

    return response;
  }
}

class UserService {
  final String apiUrl = 'http://172.29.128.1/test_magang/user.php';

  Future<List<dynamic>> getAllUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}

class UserDelete {
  final String apiUrl = 'http://172.29.128.1/test_magang/deleteuser.php';

  Future<Map<String, dynamic>> deleteUser(String id) async {
    final response = await http.post(Uri.parse(apiUrl), body: {'id': id});

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      return {'success': result['success'], 'message': result['message']};
    } else {
      throw Exception('Failed to delete user with ID $id');
    }
  }
}

class UserUpdate {
  final String apiUrl = 'http://172.29.128.1/test_magang/updateuser.php';

  Future<Map<String, dynamic>> updateUser(String id, String username,
      String password, String noTelp, String alamat) async {
    final response = await http.post(Uri.parse(apiUrl), body: {
      'id': id,
      'username': username,
      'password': password,
      'notelp': noTelp,
      'alamat': alamat
    });

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      return {'success': result['success'], 'message': result['message']};
    } else {
      throw Exception('Failed to update user data');
    }
  }
}
