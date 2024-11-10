import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:smart_usb_desktop/authentication/data/AuthRepository.dart';
import 'package:http/http.dart' as http;
import 'package:smart_usb_desktop/authentication/domain/ProfessorModel.dart';

class HttpAuthRepository implements AuthRepository {
  const HttpAuthRepository({required this.client, required this.domain});

  final String domain;
  final http.Client client;

  @override
  Future postLogin({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(Uri.http(domain, "auth/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "password": password}));
      if (response.statusCode == 200) {
        return ProfessorModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
