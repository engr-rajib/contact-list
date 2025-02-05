import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Contact> contacts = List.empty(growable: true);

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

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
              controller: nameController,
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: numberController,
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
            child: ElevatedButton(
              onPressed: () {
              String name = nameController.text.trim();
              String number = numberController.text.trim();
              if (name.isNotEmpty && number.isNotEmpty && number.length == 11) {
                setState(() {
                  nameController.text = '';
                  numberController.text = '';
                  contacts.add(Contact(name: name, number: number));
                });
              }
            },
              child: Text("ADD",),
            ),
          ),
          contacts.isEmpty ? Text('No Contacts') :
          Expanded (
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) => getRow(index),
            ),
          )
        ],
      ),
    );
  }

  Widget getRow (int index) {
    return Card (
      child: ListTile(
        leading: Icon(Icons.person, size: 25,),
        trailing: Icon(Icons.call, size: 25, color: Colors.green,),
        title: Text (contacts[index].name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20),),
        subtitle: Text (contacts[index].number),
        onLongPress: () {
          showDialog(context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text("Confirmation", style: TextStyle(fontWeight: FontWeight.bold),),
                content: Text("Do you want to Delete the selected Contact?", style: TextStyle(fontSize: 20),),
                actions: [
                  IconButton(
                      onPressed: () {Navigator.of(context).pop();}, 
                      icon: Icon(Icons.not_interested_outlined, color: Colors.green,)),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          contacts.removeAt(index);
                        }
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red,))
                ],
              )
          );
        },
        ),
      );
  }
}
