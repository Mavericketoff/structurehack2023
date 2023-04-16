import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:structurehack2023/screens/nfc_reader_page.dart';
import 'package:structurehack2023/screens/qrView_screen.dart';

import '../utils/navigationUtils.dart';

class CardListPage extends StatefulWidget {
  const CardListPage({Key? key}) : super(key: key);

  @override
  _CardListPage createState() => _CardListPage();
}

class _CardListPage extends State<CardListPage> with SingleTickerProviderStateMixin{

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState(){

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);


    super.initState();


  }
  final List<Map<String, String>> _businessCards = [];
  int _selectedIndex = 1;

@override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text('Добавленные визитки',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 42,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
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
                          Color.fromARGB(235, 83, 225, 238),
                          Color.fromARGB(230, 164, 32, 162),
                        ],
                      ),
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      'Иванова',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'Анастастия          Евгеньевна',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Divider(thickness: 2.0,color: Colors.white,),
                                    SizedBox(height: 8,),
                                    Text(
                                      'Юрист\nКриста',
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
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(16.0),
                                child: FloatingActionButton.extended(
                                  backgroundColor: Colors.black45,
                                  onPressed: () {},
                                  label: const Text(
                                    'Позвонить',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(16.0),
                                child: IconButton(
                                  color: Colors.black45,
                                  onPressed: () {},
                                  icon: const Icon(Icons.mail),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(16.0),
                                child: IconButton(
                                  color: Colors.black45,
                                  onPressed: () {},
                                  icon: const Icon(Icons.telegram),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35,),
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
                                      'Аргов',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'Дмитрий            Игоревич',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Divider(thickness: 2.0,color: Colors.white,),
                                    SizedBox(height: 8,),
                                    Text(
                                      'Бизнес-консультант\nОДК "САТУРН"',
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
                                        margin: const EdgeInsets.only(bottom: 14.0),
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
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(16.0),
                                child: FloatingActionButton.extended(
                                  backgroundColor: Colors.black45,
                                  onPressed: () {},
                                  label: const Text(
                                    'Позвонить',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(16.0),
                                child: IconButton(
                                  color: Colors.black45,
                                  onPressed: () {},
                                  icon: const Icon(Icons.mail),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(16.0),
                                child: IconButton(
                                  color: Colors.black45,
                                  onPressed: () {},
                                  icon: const Icon(Icons.telegram),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title:"NFC",
              iconColor :Colors.black,
              bubbleColor : const Color.fromARGB(255, 96, 238, 83),
              icon:Icons.nfc,
              titleStyle:const TextStyle(fontSize: 16 , color: Colors.black),
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NfcReader()));
                _animationController.reverse();
              },
            ),
            //Floating action menu item
            Bubble(
              title:"QR",
              iconColor :Colors.black,
              bubbleColor : const Color.fromARGB(255, 96, 238, 83),
              icon:Icons.qr_code_scanner,
              titleStyle:const TextStyle(fontSize: 16 , color: Colors.black),
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QRViewExample(),),);
                _animationController.reverse();
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation state
          onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),

          // Floating Action button Icon color
          iconColor: Colors.black,

          // Flaoting Action button Icon
          iconData: Icons.document_scanner,
          backGroundColor: const Color.fromARGB(255, 96, 238, 83),
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

  Map<String, String> _parseQrCode(String qrCode) {
    // Здесь нужно реализовать код для парсинга QR-кода
    // и извлечения информации о визитке.
    // В этом примере мы просто разбиваем строку по запятым
    // и создаем словарь с ключами 'name', 'position' и т.д.
    List<String> fields = qrCode.split(',');
    return {
      'name': fields[0],
      'position': fields[1],
      'company': fields[2],
      'phone': fields[3],
      'email': fields[4],
      'address': fields[5],
    };
  }

  void _showBusinessCard(Map<String, String> businessCard) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(businessCard['name']!),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  businessCard['position']!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  businessCard['company']!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Телефон: ${businessCard['phone']}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Email: ${businessCard['email']}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Адрес: ${businessCard['address']}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FloatingActionButton(
              child: const Text('Закрыть'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}








