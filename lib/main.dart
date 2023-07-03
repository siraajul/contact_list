import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'John Doe', email: 'john.doe@example.com', phone: '1234567890'),
    Contact(
        name: 'Jane Doe', email: 'jane.doe@example.com', phone: '0987654321'),
    Contact(
        name: 'Bob Builder',
        email: 'bob.builder@example.com',
        phone: '1122334455'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            // subtitle: Text(contacts[index].email),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Contact Details',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Name: ${contacts[index].name}',
                            style: TextStyle(fontSize: 16)),
                        Text('Email: ${contacts[index].email}',
                            style: TextStyle(fontSize: 16)),
                        Text('Phone: ${contacts[index].phone}',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phone;

  Contact({required this.name, required this.email, required this.phone});
}
