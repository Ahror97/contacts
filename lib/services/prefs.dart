import 'package:groupb/models/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addContact(Contact contact) async {
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = prefs.getInt('counter') ?? 0;
  await prefs.setString('name' + counter.toString(), contact.name);
  await prefs.setString('number' + counter.toString(), contact.phoneNumber);
  await prefs.setString('email' + counter.toString(), contact.email);
  await prefs.setInt('counter', counter + 1);
}

Future<List<Contact>> getContacts() async {
  await Future.delayed(Duration(seconds: 2));
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = prefs.getInt('counter') ?? 0;
  List<Contact> contacts = [];
  for (int i = 0; i < counter; i++) {
    contacts.add(Contact(
        name: prefs.getString('name' + i.toString())!,
        phoneNumber: prefs.getString('number' + i.toString())!,
        email: prefs.getString('email' + i.toString())!));
  }
  return contacts;
}
