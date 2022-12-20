import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class Person {
  //class for Person object
  String id, name, phone, address;
  Person(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address});
}

class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Person> persons = [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    persons.add(Person(
        id: "1", name: "Ayaan", phone: "12345678", address: "Skole Allé 71"));
    persons.add(Person(
        id: "2", name: "Dale", phone: "12121213", address: "Andekæret 37"));
    persons.add(Person(
        id: "3", name: "Roland", phone: "44454647", address: "Højbovej 21"));
    persons.add(Person(
        id: "4", name: "Jessica", phone: "90909099", address: "Mellemvej 10"));
    persons.add(Person(
        id: "5", name: "Morten", phone: "90909097", address: "Roskildevej 25"));
    persons.add(Person(
        id: "6", name: "John", phone: "60909099", address: "novembervej 45"));
    persons.add(Person(
        id: "7", name: "Søren", phone: "23909099", address: "lyngevej 12"));
    persons.add(Person(
        id: "8", name: "Sofie", phone: "87909099", address: "højvej 78"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Delete"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: persons.map((personone) {
                return Card(
                  child: ListTile(
                    title: Text(personone.name),
                    subtitle: Text("${personone.phone}\n${personone.address}"),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Icon(Icons.delete),
                      onPressed: () {
                        //delete action for this button
                        persons.removeWhere((element) {
                          return element.id == personone.id;
                        }); //go through the loop and match content to delete from list
                        setState(() {
                          //refresh UI after deleting element from list
                        });
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
