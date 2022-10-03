import "package:flutter/material.dart";

import "package:app/data.dart";
import "package:app/services.dart";

void main() {
  runApp(UsersApp());
}

class UsersApp extends StatefulWidget {
  @override
  createState() { return UsersState(); }
}

class UserBox extends StatelessWidget {
  final User user;

  UserBox(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Text(user.name),
          Text("${user.id}, ${user.email}"),
        ]
      )  
    );
  }
}

class UsersState extends State<UsersApp> {
  List<User> users = [];

  void getUsers() async { 
    final List<User> data = await getAllUsers();
    void setData() { users = data; }

    setState(setData);
    print('Done');
  } 

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('All users')),
        floatingActionButton: FloatingActionButton(
          onPressed: getUsers,
          tooltip: 'Get all users',
          child: Icon(Icons.download),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (User user in users) 
              UserBox(user),
          ],
        )
      ),
    );
  }
}
