import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:por_maria_app/commons/Constants.dart';
import 'package:por_maria_app/commons/HttpHandler.dart';
import 'package:por_maria_app/models/user_model.dart';
import 'package:por_maria_app/ui/home/main_screen.dart';
import 'package:por_maria_app/utils/design_utils/design.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late StreamChatClient _streamChatClient;

  @override
  void initState() {
    _streamChatClient = StreamChatClient(STREAM_CHAT_KEY, logLevel: Level.INFO);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      builder: (context, child) {
        return StreamChat(client: _streamChatClient, child: child);
      },
      home: LogInSignIn(),
    );
  }
}

class LogInSignIn extends StatefulWidget {
  @override
  _LogInSignInState createState() => _LogInSignInState();
}

class _LogInSignInState extends State<LogInSignIn> {
  final TextEditingController _usernameTextFieldController =
      TextEditingController();

  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  String _usernameError = "";
  String _paswwordError = "";
  String _loginError = "";

  bool _loading = false;

  Future<void> _onGoPressed() async {
    UserModel _userModel;
    bool existUser = false;
    final username = _usernameTextFieldController.text;
    final password = _passwordTextFieldController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      setState(() {
        _usernameError = "";
        _paswwordError = "";
      });
      // Crear un mapa con los valores
      final Map<String, dynamic> userLoginData = {
        'username': username,
        'password': password,
      };

      // Convertir el mapa a una cadena JSON
      final String jsonUserLoginData = json.encode(userLoginData);
      try {
        var data = await HttpHandler().userLogin(jsonUserLoginData);
        setState(() {
          _userModel = UserModel.fromJson(data);
          existUser = true;
        });
      } catch (e) {
        print('Error durante la conexión: $e');
      }

      if (existUser) {
        final client = StreamChat.of(context).client;
        final token = client.devToken(username);
        setState(() {
          _loading = true;
        });
        try {
          await client.connectUser(
              User(id: username, extraData: {
                'image': DesignUtils.getUserImage(username),
              }),
              token.rawValue);
          setState(() {
            _loading = false;
            _loginError = "";
          });

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const MainScreenPage()));
        } catch (e) {
          // Maneja cualquier error que pueda ocurrir durante la conexión o autenticación.
          print('Error durante la conexión: $e');
          // También puedes mostrar un mensaje de error al usuario si es necesario.

          setState(() {
            _loading = false;
            _loginError = "Error de autenticación";
          });
        }
      } else {
        _loginError = "No existe el usuario";
      }
    } else {
      if (username.isEmpty) {
        setState(() {
          _usernameError = "Ingrese el nombre de usuario";
        });
      }
      if (password.isEmpty) {
        setState(() {
          _paswwordError = "Ingrese la contraseña";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _loading
              ? const CircularProgressIndicator()
              : Card(
                  surfaceTintColor: Colors.white,
                  elevation: 11,
                  margin: const EdgeInsets.all(15.0),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Bienvenido a PorMariApp',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: _usernameTextFieldController,
                            decoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.white),
                                hintText: 'Usuario',
                                errorStyle:
                                    TextStyle(color: Colors.redAccent[700]),
                                errorText: _usernameError.isEmpty
                                    ? _loginError
                                    : _usernameError),
                          ),
                          TextField(
                            controller: _passwordTextFieldController,
                            decoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.white),
                                hintText: 'Contraseña',
                                errorStyle:
                                    TextStyle(color: Colors.redAccent[700]),
                                errorText: _paswwordError.isEmpty
                                    ? _loginError
                                    : _paswwordError),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: _onGoPressed,
                                  child: const Text('Iniciar sesión')),
                              ElevatedButton(
                                  onPressed: null,
                                  child: const Text('Registrarte')),
                            ],
                          ),
                        ],
                      )))),
    );
  }
}
