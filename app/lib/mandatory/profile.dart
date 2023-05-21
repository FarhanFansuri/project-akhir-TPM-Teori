import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Identity extends StatelessWidget {
  const Identity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white54,
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 65,
                  backgroundImage: AssetImage("assets/profile.jpeg"),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Farhan Fansuri",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("@farhanfansuri")],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Memiliki minat di bidang musik\n dan programming",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.white70,
              margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                leading: Icon(
                  Icons.privacy_tip_sharp,
                  color: Colors.black54,
                ),
                title: Text(
                  '123200127',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white70,
              margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                leading: Icon(
                  Icons.privacy_tip_sharp,
                  color: Colors.black54,
                ),
                title: Text(
                  'Bermain musik',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white70,
              margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                leading: Icon(
                  Icons.privacy_tip_sharp,
                  color: Colors.black54,
                ),
                title: Text(
                  'IF-C',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
