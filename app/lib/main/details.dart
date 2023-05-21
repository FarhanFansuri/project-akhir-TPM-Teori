import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'books.dart';
import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../main/books.dart';
import 'generator.dart';

void beli(data, price) async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(157)) {
    Hive.registerAdapter(BooksDataAdapter());
  }

  var box = await Hive.openBox('DaaBox');

  dynamic allData = [];
  dynamic result = BooksData(
      id: data.id,
      title: data.title,
      isbn: data.isbn,
      pageCount: data.pageCount,
      publishedDate: data.publishedDate,
      thumbnailUrl: data.thumbnailUrl,
      shortDescription: data.shortDescription,
      longDescription: data.longDescription,
      status: data.status,
      authors: data.authors,
      categories: data.categories,
      price: num.parse(price));
  if (box.get('pesanan') == null) {
    allData.add(result);
    box.put('pesanan', allData);
  } else {
    List<dynamic> sendata = box.get('pesanan');
    sendata.add(result);
    box.put('pesanan', sendata);
  }
  box.get('pesanan').forEach((result) => {print(result.title)});
}

class Buy extends StatefulWidget {
  Books? value;
  Buy({this.value});

  @override
  State<Buy> createState() => _BuyState(value: value);
}

class _BuyState extends State<Buy> {
  _BuyState({this.value});
  Books? value;
  String? selectedOption;
  Map<String, dynamic>? currency;

  Future<dynamic> fetchData() async {
    final headers = {
      'Content-Type': 'application/json',
      'apikey': 'KXZkIbmkoq5ZSjt3PhQpJAIVUX92q7ka'
    };
    final response = await http.get(
      Uri.parse('https://api.apilayer.com/currency_data/live?base=USD'),
      headers: headers,
    );

    final responselist = await http.get(
      Uri.parse('https://api.apilayer.com/currency_data/list'),
      headers: headers,
    );

    if (responselist.statusCode == 200) {
      currency = jsonDecode(responselist.body)['currencies'];
    }
    if (response.statusCode == 200) {
      return response.body; // Returns the response body as a string
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  String? cur;
  num? satuan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pembelian"),
      ),
      body: FutureBuilder<dynamic>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            String isbn = value?.isbn ??
                '0'; // Menggunakan operator ?. dan ?? untuk menangani nilai null
            int pageCount = value?.pageCount ?? 0;

            String usdPrice = (int.parse(isbn) / 123456772 + pageCount / 100)
                .toStringAsFixed(2);

            // ignore: unnecessary_question_mark
            dynamic? data = jsonDecode(snapshot.data!) as Map<String, dynamic>?;
            return Container(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  const SizedBox(height: 50.0),
                  Center(
                      child:
                          Image(image: NetworkImage('${value?.thumbnailUrl}'))),
                  const SizedBox(height: 30.0),
                  Text(
                    "${value?.title}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Card(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ISBN",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("${value?.isbn}")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Categories",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("${value?.categories}")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Halaman",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("${value?.pageCount}")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Deskripsi",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${value?.shortDescription}",
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Harga",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text("USD : $usdPrice"),
                  const SizedBox(height: 20.0),
                  Text(
                    "Harga Konversi",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "$cur : ${(satuan ?? 0 * num.parse(usdPrice)).toStringAsFixed(2)}",
                      ),
                      const SizedBox(width: 20.0),
                      DropdownButton<String>(
                        value: selectedOption,
                        hint: Text(
                            'Select an option'), // Displayed as a hint before selection
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOption = newValue;
                            cur = selectedOption;
                            satuan = data["quotes"]['USD$cur'];
                          });
                        },
                        items: currency!.keys
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          beli(
                              value,
                              (satuan ?? 0 * num.parse(usdPrice))
                                  .toStringAsFixed(2));
                        },
                        child: Text("Pesan"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Ubah warna latar belakang
                          foregroundColor: Colors.white, // Ubah warna teks
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Data not available"));
          }
        },
      ),
    );
  }
}
