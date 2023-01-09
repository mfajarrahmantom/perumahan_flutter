import 'package:flutter/material.dart';
import 'package:perumahan_flutter/screen/rumah_create.dart';
import 'package:perumahan_flutter/screen/rumah_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selamat Datang Di Agen Perumahan',
      debugShowCheckedModeBanner: false,
      initialRoute: RumahList.routeName,
      routes: {
        RumahList.routeName: (context) => const RumahList(),
        RumahCreate.routeName: (context) => const RumahCreate(),
      },
    );
  }
}
