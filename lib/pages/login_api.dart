import 'dart:convert';
import 'package:carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {

  static Future<Usuario> login(String login, String senha) async {

    Map<String,String> headers = {
      "Content-type": "application/json"
    };


    var url = 'http://carros-springboot.herokuapp.com/api/v2/login';
    Map params = {
      "username": login,
      "password": senha
    };
    var response = await http.post(url, body: json.encode(params), headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapReponse = json.decode(response.body);


    final user = Usuario.fromJson(mapReponse);
    return user;

  }

}