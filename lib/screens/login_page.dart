import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';


import '../utils/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      setState(() {
        _isLoading = true;
      });

      _makePostRequest() async {

        final encoding = Encoding.getByName('utf-8');
        final headers = {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.acceptHeader: 'application/json',
        };
        // set up POST request arguments
        final url = Uri.parse('http://95.163.236.76:80/registration/');
        final json = '{"login": "$username", "pass": "$password"}';
        // make POST request
        final response = await post(url, headers: headers, body: json, encoding: encoding);

        // check the status code for the result
        final statusCode = response.statusCode;

        // this API passes back the id of the new item added to the body
        final body = jsonDecode(response.body);

        if(body["response"]["status"] == "ok"){
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Ошибка!"),
              content: Text(body["response"]['data'].toString()),
              actions: [
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }

      }

      _makePostRequest();

      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      //backgroundColor: kBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 96, 238, 83),
              Color.fromARGB(255, 40, 164, 156),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('/Users/mavericketoff/IdeaProjects/structurehack2023/lib/assets/logo3.png', scale:2.3,),
                  const SizedBox(
                    height: 35,
                  ),
                  // Hello again!
                  Text('С возвращением!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 42,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Давно не виделись',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // email or username text-field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ваш логин',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // password text-field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Пароль',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(20),
                        //fixedSize: Size.fromHeight(60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        if (username.isNotEmpty &&
                            password.isNotEmpty) {
                            _submitForm();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                title: const Text("Ошибка!", style: const TextStyle(color: Colors.white),),
                                content: const Text("Заполните все поля!", style: const TextStyle(color: Colors.white),),
                                actions: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.lightGreen,
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('OK', style: const TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                            );
                          }
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: const Center(
                        child: Text(
                          'Войти',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
