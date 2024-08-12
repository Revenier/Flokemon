import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class Account {
  String? Username;
  String? email;
  String? password;
  String? name;
  int? Role;

  Account(
      {required this.Username,
      required this.password,
      required this.email,
      required this.name,
      required this.Role});

  factory Account.fromJson(Map<String, dynamic> json) => Account(
      Username: json["username"].toString(),
      email: json["email"].toString(),
      password: json["userpass"].toString(),
      name: json["name"].toString(),
      Role: json["accountstatus"] as int);
}
