import 'package:flutter/material.dart';
import 'package:groupb/screens/addContact.dart';
import 'package:groupb/screens/homeScreen.dart';
import 'package:groupb/services/prefs.dart';
import '../models/contact.dart';

class ContactDetail extends StatelessWidget {
  static const String routeName = '/contactDetail';
  final Contact contact;
  //final int index;

  //ContactDetail(this.contact, this.index, {super.key});
  ContactDetail(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(contact.name),
            Text(contact.phoneNumber),
            Text(contact.email),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddContact.routeName,
                      arguments: contact
                      // {
                      //   'contact': contact,
                      //   'index': index,
                      // }
                      );
                },
                child: Text('Edit')),
            ElevatedButton(
                onPressed: () async {
                  await deleteContact(contact.id);
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, HomePage.routeName, (route) => false);
                  Navigator.pop(context, 5);
                },
                child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
