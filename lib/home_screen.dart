import 'dart:convert';
import 'api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String url;
  var Data;

  String QuerryText = 'Querry';
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
                url = 'http://10.0.2.2:5000/api?Querry=' + value.toString();
              },
              decoration: InputDecoration(
                hintText: "Search Anything Here",
                suffixIcon: GestureDetector(
                  onTap: () async {
                    Data = await getdata(Uri.parse(url));
                    var decodedData = jsonDecode(Data);
                    setState(() {
                      QuerryText = decodedData['Querry'];
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
              QuerryText,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
