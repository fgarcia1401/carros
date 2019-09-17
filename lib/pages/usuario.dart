
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
     roles = map["roles"] != null ? map["roles"].map<String>((role) => role.toString()).toList() : "";

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }


}