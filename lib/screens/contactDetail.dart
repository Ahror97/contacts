import 'package:flutter/material.dart';
import 'package:groupb/screens/addContact.dart';
import '../models/contact.dart';
import '../data.dart';

class ContactDetail extends StatelessWidget {
  static const String routeName = '/contactDetail';
  int index;

  ContactDetail(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(contacts[index].name),
          Text(contacts[index].phoneNumber),
          Text(contacts[index].email),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddContact.routeName,
                    arguments: index);
              },
              child: Text('Edit')),
        ],
      ),
    );
  }
}
