
import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable(nullable: false)
class Usuario {
  String login;
  String nome;
  String email;
  String token;

  Usuario(this.login, this.nome, this.email, this.token);

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String,dynamic> toJson() => _$UsuarioToJson(this);

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token}';
  }


}