import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/navigationUtils.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool _isDarkMode = false;
  int _selectedIndex = 2;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Настройки', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ListTile(
            title: Text('Версия приложения', style: TextStyle(color: Colors.black),),
            subtitle: Text('1.0.0', style: TextStyle(color: Colors.black),),
          ),
          const Divider(color: Colors.black,),
          const ListTile(
            title: Text('Разработчик', style: TextStyle(color: Colors.black),),
            subtitle: Text('Project D', style: TextStyle(color: Colors.black),),
          ),
          const Divider(color: Colors.black,),
          const ListTile(
            title: Text('Email', style: TextStyle(color: Colors.black),),
            subtitle: Text('projectD@example.com', style: TextStyle(color: Colors.black),),
          ),
          const Divider(color: Colors.black,),
          SwitchListTile(
            inactiveTrackColor: Colors.black,
            activeColor: const Color.fromARGB(255, 96, 238, 83),
            title: const Text('Dark Mode', style: TextStyle(color: Colors.black),),
            value: _isDarkMode,
            onChanged: _toggleDarkMode,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
            size: 38,
            color: Color.fromARGB(255, 96, 238, 83),
        ),
        unselectedIconTheme: const IconThemeData(
          size: 32,
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pushReplacement(
            context,
            getPageByIndex(_selectedIndex),
          );
        },
      ),
    );
  }
}
