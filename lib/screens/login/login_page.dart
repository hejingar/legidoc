import 'package:dockable/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:oauth2/oauth2.dart' as oauth2;
import './components/validator.dart';
import 'package:dockable/screens/main/main_screen.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:dockable/controllers/MenuAppController.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();



  final String authEndpoint = 'http://api.docable.fr:8000/token';

  Future<String> getToken(String username, String password) async {
    // Define the request body with your OAuth2 credentials
    final Map<String, String> body = {
      'grant_type': '',
      'username': username,
      'password': password,
      'client_id' : '',
      'client_secret' : '',
    };

    try {
      final response = await http.post(
        Uri.http('api.docable.fr:8000', '/token'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          // Add any other headers if required
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // Successful response
        final Map<String, dynamic> data = json.decode(response.body);
        String accessToken = data['access_token'];
        print(accessToken);
        return (accessToken);
      } else {
        // Handle errors, e.g., display an error message
        print('Failed to obtain access token. Status code: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      return '';
    }
  }

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Authentication'),
        ),
        body: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailTextController,
                          focusNode: _focusEmail,
                          //put back validator for release version
                          // validator: (value) => Validator.validateEmail(
                          //   email: value,
                          // ),
                          decoration: InputDecoration(
                            hintText: "Username",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          obscureText: true,
                          validator: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        _isProcessing
                            ? const CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        _focusEmail.unfocus();
                                        _focusPassword.unfocus();

                                        if (_formKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            _isProcessing = true;
                                          });
                                          username = _emailTextController.text;
                                          // var client = await getToken();
                                          userToken = await getToken(_emailTextController.text, _passwordTextController.text);
                                          // print(await client.read('http://example.com/protected-resources.txt'));

                                          setState(() {
                                            _isProcessing = false;
                                          });

                                          if (userToken != '') {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MultiProvider(
                                                      providers: [
                                                        ChangeNotifierProvider(
                                                          create: (context) => MenuAppController(),
                                                        ),
                                                      ],
                                                      child: const MainScreen(),
                                                    ),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 24.0),
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
        ),
      );
  }
}
