import 'package:flutter/material.dart';

class BusinessCard {
  final String name;
  final String company;
  final String phone;
  final String email;

  BusinessCard({
    required this.name,
    required this.company,
    required this.phone,
    required this.email,
  });
}
class Contact {
  final String name;
  final String email;
  final String phone;
  final String head;

  Contact({required this.name, required this.email, required this.phone, required this.head});
}

class ContactCard extends StatelessWidget {
  final Contact contact;

  ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 200.0,
              child: Stack(
                children: [
                   Center(
                    child: Text(
                      contact.head,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo3.png',
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ContactList extends StatelessWidget {
  final List<Contact> contacts;

  ContactList({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactCard(contact: contacts[index]);
      },
    );
  }
}
