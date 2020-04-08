import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey   = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acesso', style: TextStyle(color: Colors.white), ),
        centerTitle: true,
      ),
      body: _body(context),      
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            _textFormField(
              'login',
              'Digite o Login',
              controller: _ctrlLogin,
              validator : _validaLogin
            ),
            _textFormField(
              'Senha',
              'Digite a Senha',
              senha: true,
              controller: _ctrlSenha,
              validator : _validaSenha 
            ),
            _raisedButton('Login', Colors.orange, context),
          ],
        ),
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
      bool senha = false,
      TextEditingController controller,
      FormFieldValidator<String> validator,
    }) {
      return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: senha,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      );
    }

    String _validaLogin(String texto) {
      if(texto.isEmpty){
        return 'Digite o Login';
      }
      if(texto.length < 3){
        return 'Maior que 3';
      }
      return null;
    }

    String _validaSenha(String texto) {
      if(texto.isEmpty){
        return 'Digite a Senha';
      }
      return null;
    }

    _raisedButton(
      String texto,
      Color cor,
      BuildContext context) {
        return RaisedButton(
          color: cor,
          child: Text(
            texto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            _clickButton(context);
          },
        );
      }

      void _clickButton(BuildContext context) {
        bool formOk =  _formKey.currentState.validate();

        if (!formOk) {
          return;
        }

        String login = _ctrlLogin.text;
        String senha = _ctrlSenha.text;

        print('login: $login senha $senha');
      }
    
  
}