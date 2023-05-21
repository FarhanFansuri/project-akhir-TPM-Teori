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
      var result = box.get('pesanan');
      return result;
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
                // ignore: avoid_print
                List dataList = snapshot.data as List;
                for (int x = 0; x < dataList.length; x++) {
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
                          ListTile(
                            leading: Image(
                                image: NetworkImage(
                                    '${dataList[x].thumbnailUrl}')),
                            title: Text('${dataList[x].title}'),
                            subtitle: const Text('Pembelian'),
                          ),
                        ],
                      ),
                    ),
                  ));
                }
                ;
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
