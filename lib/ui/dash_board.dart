import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rock_paper_sissors/util/color.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Lottie.asset('assets/animations/rps.json'),
          CusCard(
              text: 'Play Game',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  Get.context!,
                  '/home',
                  (route) => false,
                );
              }),
          CusCard(text: 'Rules', onTap: () {
            Navigator.pushNamed(Get.context!, '/rule');
          }),
        ],
      ),
    );
  }
}

class CusCard extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CusCard({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
