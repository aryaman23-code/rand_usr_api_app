// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  Future<void> fetchusers() async {
    // print('fetched users called ');

    //TODO; try this format in the weather app api applicatoin

    //IMPORTANT NOTE
    try {
      const url = 'https://randomuser.me/api/?results=28';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      Map json = jsonDecode(body);
      // print(json);

      setState(() {
        users = json['results'];
      });
      // print(' the fetch is complete');
    } catch (e) {
      print('error $e');
    }

    // Response response = await get(
    //     Uri(scheme: 'https', host: 'randomuser.me', path: '/api/', queryParameters: 'results=2'));
    // Map data = jsonDecode(response.body);
    // print(data);

    // Response response = await get(Uri(
    //       scheme: 'http', host: 'worldtimeapi.org', path: 'api/timezone/Europe/Berlin'));
    //   Map data = jsonDecode(response.body);
    //   print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Working with a Rest Api',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final image_url = users[index]['picture']['thumbnail'];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(image_url)),
              title: Text(users[index]['name']['first']),
              subtitle: Text(users[index]['email']),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchusers,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}


