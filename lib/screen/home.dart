// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:api_flutter_working/model/user.dart';
import 'package:api_flutter_working/services/user_apis.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Working with a Rest Api',
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            // final color =
            //     users[index].gender == 'male' ? Colors.blue : Colors.pink;
            final user = users[index];
            final image_url = user.pic.thumbnail;

            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(image_url)),
              title: Text(user.getFUllName()),
              subtitle: Text(
                  '${user.location.state} ${user.dob.date.toString().substring(0, 11)}'),

              // tileColor: color,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchusers,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> fetchusers() async {
    final response = await UserApi.fetchusers();
    setState(() {
      users = response;
    });
  }
}
