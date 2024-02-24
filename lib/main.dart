import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_paper_sissors/ui/dash_board.dart';
import 'package:rock_paper_sissors/ui/home.dart';
import 'package:rock_paper_sissors/ui/rules.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rock Paper Scissors',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        getPages: [
          GetPage(name: '/', page: ()=>const DashBoard()),
          GetPage(name: '/home', page: ()=>const Home()),
          GetPage(name: '/rule', page: ()=>const Rules()),
        ],
      ),
    );
  }
}
