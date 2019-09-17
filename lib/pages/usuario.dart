import 'package:flutter/material.dart';

class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map) :
     login = map["login"],
     token = map["token"],
     nome  = map["nome"],
     email = map["email"],
     roles = getRoles(map);

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }

  static List<String> getRoles(Map<String, dynamic> map) {
    List list = map["roles"];
    return list.map<String>((role) => role.toString()).toList();
  }


}