import 'dart:convert';
import 'package:carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class LoginApi {

  static Future<ApiResponse> login(String login, String senha) async {

   try {
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

     if (response.statusCode == 200) {
       final user = Usuario.fromJson(mapReponse);
       return ApiResponse.ok(user);
     }

     return ApiResponse.error(mapReponse["error"]);
   } catch(error, exception) {
      print("Erro no login $error > $exception");
      return ApiResponse.error("Não foi possivel fazer o login.");
   }

  }

}