import 'package:app/konversi/matauang.dart';
import 'package:app/konversi/waktu.dart';
import 'package:app/main/menu.dart';
import 'package:app/main/riwayat.dart';
import 'package:app/mandatory/kesan.dart';
import 'package:app/mandatory/profile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'auth/login.dart';
import 'main/details.dart';
import 'main/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Menu(),
    routes: {
      '/home': (context) => const Home(),
      '/matauang': (context) => const MataUang(),
      '/waktu': (context) => const Dateandtime(),
      '/login': (context) => const Login(),
      '/riwayat': (context) => const Riwayat(),
      '/kesan': (context) => const Kesan(),
      '/profile': (context) => const Identity(),
      '/menu': (context) => const Menu()
    },
  ));
}
