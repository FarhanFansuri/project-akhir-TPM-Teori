import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'books.dart';
import 'details.dart';
import 'list.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

List<dynamic> data = [];

class _HomeState extends State<Home> {
  List<Widget> mywidgets = [];

  Future<dynamic> fetchBooks() async {
    final response = await http
        .get(Uri.parse('https://project-tpm.netlify.app/api/v1/amazon/books'));

    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      print("successs");
      List<Books> books = it.map((e) => Books.fromJson(e)).toList();

      return books;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            } else if (snapshot.connectionState == ConnectionState.done) {
              for (int x = 0; x < 100; x++) {
                mywidgets.add(Container(
                    margin: EdgeInsets.fromLTRB(7.0, 5.0, 7.0, .0),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                              "${snapshot.data[x]?.thumbnailUrl}",
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.grey,
                                  child: const Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                            title: Text(
                              '${snapshot.data[x]?.title}',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Klik beli untuk pembelian'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Buy(value: snapshot.data[x])));
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromARGB(255, 0, 118, 228),
                              ),
                              child: Center(
                                  child: Text(
                                'Beli',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: AutofillHints.addressCity,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )));
              }
              return Column(
                children: [
                  const SizedBox(height: 10.0),
                  ListTile(
                    title: Text(
                      "Happy Shopping",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("welcome home"),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                      child: Image.asset(
                    'assets/header.jpg',
                    width: MediaQuery.of(context).size.width * 0.9,
                  )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListTile(
                    title: Text(
                      "Fitur Applikasi",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("lihat daftar"),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Row(
                      children: [
                        Card(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/riwayat');
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Riwayat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Pembelian")
                                  ]),
                            ),
                          ),
                        )),
                        Card(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/waktu');
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Konversi",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Waktu")
                                  ]),
                            ),
                          ),
                        )),
                        Card(
                            child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ListBooks(value: mywidgets)));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Semua",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Buku")
                                  ]),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "List Buku",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("lihat daftar"),
                  ),
                  Row(
                    children: [
                      Card(
                          child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    snapshot.data[1].thumbnailUrl,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  Column(
                                    children: [],
                                  )
                                ]),
                          ),
                        ),
                      )),
                      Card(
                          child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    snapshot.data[2].thumbnailUrl,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  Column(
                                    children: [],
                                  )
                                ]),
                          ),
                        ),
                      )),
                      Card(
                          child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    snapshot.data[3].thumbnailUrl,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  Column(
                                    children: [],
                                  )
                                ]),
                          ),
                        ),
                      )),
                      Card(
                          child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    snapshot.data[4].thumbnailUrl,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  Column(
                                    children: [],
                                  )
                                ]),
                          ),
                        ),
                      )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ListBooks(value: mywidgets)));
                          },
                          icon: const Icon(Icons.dataset_outlined))
                    ],
                  )
                ],
              );
            } else {
              return Text("failed");
            }
          }),
    );
  }
}
