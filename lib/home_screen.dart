import 'dart:convert';
import 'api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String url = "";

  var data;

  String output = 'Initial Text';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flask and Flutter"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                url = 'http://10.0.2.2:5000/api?query=' + value.toString();
              },
              decoration: InputDecoration(
                hintText: "Search Anything Here",
                suffixIcon: GestureDetector(
                  onTap: () async {
                    data = await getdata((url));
                    var decodedData = jsonDecode(data);
                    setState(() {
                    output = decodedData['output'];
                    });
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              output,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
