import 'package:flutter/material.dart';
import 'package:groupb/models/contact.dart';
import 'package:groupb/screens/addContact.dart';
import 'package:groupb/screens/contactDetail.dart';
import 'package:groupb/services/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, AddContact.routeName,
                  // arguments: {
                  //   'index': -1,
                  // }
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: getContacts(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Contact> contacts = snapshot.data!;

          return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ContactDetail.routeName,
                            arguments: contacts[index]
                            //  {
                            //   'contact': contacts[index],
                            //   'index': index,
                            // }
                            )
                        .then((value) {
                      print(value);
                      setState(() {});
                    });
                  },
                  leading: Text((index + 1).toString()),
                  title: Text(contacts[index].name),
                );
              });
        },
      ),
    );
  }
}
