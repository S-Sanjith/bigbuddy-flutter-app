import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8080';

  Future<bool> signUp(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/signup');
    final body = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
    });

    try {
      final response = await http.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/json', // Set the Content-Type header
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error signing up: $e');
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final body = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
      final response = await http.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/json', // Set the Content-Type header
        },
      );
      
      // Handle the response body to check for success or failure
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true; // Login successful
      } else {
        print('Error logging in: ${responseData["message"]}'); // Print the error message from the server
        return false;
      }
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }
}
