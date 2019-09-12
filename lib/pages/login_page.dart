import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Carros"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    final focus = FocusNode();
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _text("Login", "Digite o login", controller: _tLogin),
          SizedBox(
            height: 10,
          ),
          _text("Senha", "Digite a senha", password: true, controller: _tSenha ),
          SizedBox(
            height: 20,
          ),
          _button("Login", _onClickLogin)
        ],
      ),
    );
  }

  _text(String label, String hint, {bool password = false, TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      style: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.green)),
    );
  }

  _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed
        ,
      ),
    );
  }

  _onClickLogin() {
      String login = _tLogin.text;
      String senha = _tSenha.text;

      print("Login: $login, Senha: $senha");


  }
}
