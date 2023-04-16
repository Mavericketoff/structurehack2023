import 'package:flutter/material.dart';

import '../models/BusinessCard.dart';
import '../utils/app_colors.dart';
import '../utils/navigationUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Contact> contacts = [
    Contact(name: 'John Doe', email: 'john.doe@example.com', phone: '555-1234', head: "lol"),

  ];

  int _selectedIndex = 0;

  final String _name = '';
  final String _position = '';
  final String _company = '';
  final String _phone = '';
  final String _email = '';

  Widget _buildBusinessCard() {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _position,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _company,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Телефон: $_phone',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            'Email: $_email',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя визитка'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {

              },
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.person_add,
                        color: Colors.white,
                        size: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Создать визитку',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      // if (_name != null)
                      //   _buildBusinessCard(),
                    ],
                  ),
                ),
              ),
         ContactList(contacts: contacts),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          size: 38,
          color: Colors.lightGreen
        ),
        unselectedIconTheme: const IconThemeData(
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: kBackgroundColor,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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


