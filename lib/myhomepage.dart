import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contacts = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text("Contact List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              maxLength: 11,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Number"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: () {},
                child: Text("ADD"),),
          )
        ],
      ),
    );
  }
}
