import 'package:flutter/material.dart';
import 'package:structurehack2023/screens/about_app_screen.dart';
import 'package:structurehack2023/screens/cardList_page.dart';
import 'package:structurehack2023/screens/creating_new_card.dart';
import 'package:structurehack2023/screens/home_page.dart';
import 'package:structurehack2023/screens/login_page.dart';
import 'package:structurehack2023/screens/new_card.dart';
import 'package:structurehack2023/screens/register_page.dart';
import 'package:structurehack2023/utils/navigationUtils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: CustomPageTransitionsTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) =>const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) =>  const NewCard(),
        '/cardList': (context) => const CardListPage(),
        '/aboutApp': (context) => const AboutScreen(),
        '/createCard': (context) => CreatingNewCard(),
      },
      onGenerateRoute: (settings){
        if(settings.name == '/some_route'){
          //ничего не возвращаем пока
        }else {
          // Типо возвращаем экран ошибки (маловозможно)
        }
        return null;
      },
    );
  }
}
