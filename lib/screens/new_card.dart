import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/BusinessCard.dart';
import '../utils/navigationUtils.dart';
import 'creating_new_card.dart';


class NewCard extends StatefulWidget {
  const NewCard({Key? key}) : super(key: key);

  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {

  int _selectedIndex = 0;

  final List<Contact> contacts = [
  Contact(name: 'Лебедев Даниил', email: 'john.doe@example.com', phone: '555-1234', head: "Mobile-developer"),
    Contact(name: 'Пудов Андрей', email: 'john.doe@example.com', phone: '555-1234', head: "Product Manager"),
    Contact(name: 'Марк Власенко', email: 'john.doe@example.com', phone: '555-1234', head: "Designer"),
    Contact(name: 'Сргеев Андрей', email: 'john.doe@example.com', phone: '555-1234', head: "Back-end"),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
          child: Center(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 100.0,
                      child: Text('Приступим!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 42,
                            color: Colors.black,
                          ),
                      ),
                    ),
                    const SizedBox(height: 0,),
                    SizedBox(
                      height: 600.0,
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 96, 238, 83),
                              Color.fromARGB(255, 40, 164, 156),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 5.0,
                                      ),
                                    ),
                                        child: Image.asset(
                                      'assets/images/logo3.png',
                                      width: 80.0,
                                      height: 80.0,

                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Фамилия',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          'Имя            Отчество',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Divider(thickness: 2.0,color: Colors.white,),
                                        SizedBox(height: 8,),
                                        Text(
                                          'Должность',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(thickness: 2.0,color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'ТЕЛЕЛЕФОН',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 25.0),
                                        Row(
                                          children: const [
                                            Icon(Icons.email, color: Colors.white, size: 30,),
                                            Text(
                                              '    EMAIL',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 25.0),
                                        const Icon(Icons.telegram, color: Colors.white, size: 30,),
                                        const SizedBox(height: 25.0),
                                      ],
                                    ),
                                  ),
                                  //Правая часть
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        '+7 900 000 00 00',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const SizedBox(height: 30.0),
                                      Row(
                                        children: const [
                                          Text(
                                            'example@gmail.com',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 35.0),
                                      const Text(
                                        '@exampleName',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const SizedBox(height: 25.0),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 16.0),
                                            child: const Text(
                                              'АДРЕС',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 16.0),
                                            child: const Text(
                                              'WWW',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 16.0),
                                            child: const Text(
                                              'Моторороителей 4, кв 316',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 16.0),
                                            child: const Text(
                                              'www.example.com',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SafeArea(
                              child: Container(
                                margin: const EdgeInsets.all(16.0),
                                child: FloatingActionButton.extended(
                                  backgroundColor: Colors.black45,
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CreatingNewCard(),),);
                                  },
                                  label: const Text(
                                    'Создать',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    ContactList(contacts: contacts),
                  ],
                ),
              ),

          ),
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