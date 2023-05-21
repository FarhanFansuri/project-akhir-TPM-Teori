import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'generator.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  List<Widget> allWidgets = [];
  @override
  Widget build(BuildContext context) {
    dynamic getData() async {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(157)) {
        Hive.registerAdapter(BooksDataAdapter());
      }
      var box = await Hive.openBox('DaaBox');
      box.get('pesanan').forEach((result) => {
            allWidgets.add(Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10.0), // Ubah angka sesuai dengan radius yang diinginkan
              ),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Image(image: AssetImage('assets/cart.png')),
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          });
      return allWidgets;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Riwayat"),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(child: Text("Loading..."));
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    child: ListView(
                  children: allWidgets,
                ));
              } else {
                return Text("null");
              }
            }));
  }
}
