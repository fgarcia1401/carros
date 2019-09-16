import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text("Login", "Digite o login", controller: _tLogin, validator: _validateLogin),
            SizedBox(
              height: 10,
            ),
            _text("Senha", "Digite a senha",
                password: true, controller: _tSenha, validator: _validateSenha),
            SizedBox(
              height: 20,
            ),
            _button("Login", _onClickLogin)
          ],
        ),
      ),
    );
  }

  _text(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
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
        onPressed: onPressed,
      ),
    );
  }

  _onClickLogin() {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
  }

  String _validateLogin(String text) {
      if(text.isEmpty) {
        return "Digite o login";
      }
      return null;
  }

  String _validateSenha(String text) {
    if(text.isEmpty) {
      return "Digite a senha";
    }

    if(text.length < 3) {
      return "A senha precisa ter pelo menos 3 numeros";
    }
    return null;
  }
}
