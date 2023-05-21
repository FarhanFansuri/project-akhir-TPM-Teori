import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Kesan extends StatelessWidget {
  const Kesan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Kesan',
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 24.0,
                        )),
                    Text(
                        "Saya ingin berbagi kesan saya tentang mata kuliah Teknologi Pemrograman Mobile yang Anda ajarkan. Mata kuliah ini telah memberikan saya wawasan yang sangat berharga tentang pengembangan aplikasi mobile dan kemampuan pemrograman yang relevan. Saya sangat menghargai dedikasi dan pengetahuan yang Anda tampilkan dalam setiap sesi kuliah. Melalui materi yang diajarkan, saya merasa lebih percaya diri dalam membangun aplikasi mobile yang fungsional dan responsif."),
                    Text('Pesan',
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 24.0,
                        )),
                    Text(
                        "Terima kasih atas dedikasi dan bimbingan yang Anda berikan selama mata kuliah Teknologi Pemrograman Mobile. Saya sangat menghargai upaya Anda dalam memberikan penjelasan yang jelas dan memecahkan masalah selama praktikum. Saya merasa termotivasi untuk terus belajar dan mengembangkan keterampilan pemrograman mobile saya. Semua pengetahuan yang saya peroleh dari mata kuliah ini akan sangat bermanfaat dalam karir saya di bidang pengembangan aplikasi mobile. Saya berharap dapat terus belajar dari Anda di masa depan dan mengambil lebih banyak lagi mata kuliah yang Anda ajarkan.")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
