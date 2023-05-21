import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListBooks extends StatefulWidget {
  List<Widget> value = [];
  // const ListBooks({super.key, required List<Widget> value});
  ListBooks({super.key, required this.value});

  @override
  State<ListBooks> createState() => _ListBooksState(value: value);
}

class _ListBooksState extends State<ListBooks> {
  List<Widget> value;
  _ListBooksState({required this.value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semua Buku"),
      ),
      body: Container(
        child: ListView(
          children: value,
        ),
      ),
    );
  }
}
