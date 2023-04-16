import 'package:flutter/material.dart';


class CreatingNewCard extends StatefulWidget{
  @override
  _CreatingNewCard createState() => _CreatingNewCard();
}

class _CreatingNewCard extends State<CreatingNewCard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 96, 238, 83),
        backwardsCompatibility: true,
        title: const Text("Новая визитка", style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: const [
                      SizedBox(height: 70,),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Формат визитки:", style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Text("Классика", style: TextStyle(fontSize: 20, color: Colors.black, ),),
                      ),
                    ],
                  ),
                  const Divider(thickness: 2,),
                  Row(children: [
                    Column(
                      children: [
                        Container(
                  margin: EdgeInsets.only(left: 16.0,),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/logo3.png',
                          width: 90.0,
                          height: 90.0,
                          color: Colors.black,

                        ),
                      ),
                    ],
                    ),
                    const SizedBox(width: 100,),
                    SizedBox(
                      width: 200,
                      child: Column(
                        children: const [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Фамилия',
                              border: OutlineInputBorder(),
                              hintText: 'Введите фамилию',
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              border: OutlineInputBorder(),
                              hintText: 'Введите имя',
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Отчество',
                              border: OutlineInputBorder(),
                              hintText: 'Введите отчество',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
              Container(
                width: 500,
                height: 270,
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    const Text("Способы связи:", style: TextStyle(fontSize: 18, color: Colors.grey),),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: 400,
                      child: Column(
                        children: const [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Фамилия',
                              border: OutlineInputBorder(),
                              hintText: 'Введите фамилию',
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              border: OutlineInputBorder(),
                              hintText: 'Введите имя',
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Отчество',
                              border: OutlineInputBorder(),
                              hintText: 'Введите отчество',
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 500,
                height: 350,

                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Дополнительно:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      const SizedBox(width: 100,),
                      SizedBox(
                        width: 200,
                        child: Column(
                          children: const [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Адрес',
                                border: OutlineInputBorder(),
                                hintText: 'Введите адрес',
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Сайт',
                                border: OutlineInputBorder(),
                                hintText: 'Введите сайт',
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                labelText: 'Описание',
                                border: OutlineInputBorder(),
                                hintText: 'Описание',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: FloatingActionButton.extended(
                        backgroundColor: Colors.black45,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        label: const Text(
                          'Создать',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}