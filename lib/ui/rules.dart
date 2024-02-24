import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_paper_sissors/util/color.dart';

class Rules extends StatefulWidget {
  const Rules({super.key});

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(Get.context!);
            },
            icon: const Icon(Icons.arrow_back,color: AppColor.onBg,)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Rules',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColor.onBg,
          ),
        ),
      ),
      backgroundColor: AppColor.bg,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'GAME PLAY :',
            style: context.textTheme.titleLarge
                ?.copyWith(color: AppColor.onBg, fontWeight: FontWeight.bold),
          ).paddingSymmetric(vertical: 10),
          Text(
            'The game is played between a human player and the computer.\n'
            "\n"
            'Both the human player and the computer start with 0 points.\n'
            "\n"
            'In each round, the human player and the computer make their choices by selecting one of the following:\n Rock, Paper, or Scissors.\n'
            "\n"
            'The choices are then compared to determine the winner of that round:\n'
            "\n"
            'Rock beats Scissors (Rock wins)\n'
            "\n"
            'Scissors beat Paper (Scissors wins)\n'
            "\n"
            'Paper beats Rock (Paper wins)\n'
            "\n",
            style: context.textTheme.titleSmall?.copyWith(color: AppColor.onBg),
          ),
          Text(
            'If both the human player and the computer choose the same option, the round is a tie, and no points are awarded.\n\n'
            'If the human player wins the round, they are awarded 1 point; if the computer wins, it receives 1 point.\n\n'
            'Keep a running total of both the human player\'s and the computer\'s points.\n\n'
            'Continue playing rounds until either the human player or the computer reaches 10 points or more.\n\n'
            'The first to reach or exceed 10 points is declared the winner of the game.\n\n',
            style: context.textTheme.titleSmall?.copyWith(color: AppColor.onBg),
          ),
          Text(
            'WINNING THE GAME',
            style: context.textTheme.titleLarge
                ?.copyWith(color: AppColor.onBg, fontWeight: FontWeight.bold),
          ).paddingSymmetric(vertical: 10),
          Text(
            'If the human player reaches 10 points before the computer, the human player wins\n\n'
            'If the computer reaches 10 points before the human player, the computer wins.',
            style: context.textTheme.titleSmall?.copyWith(color: AppColor.onBg),
          )
        ],
      ),
    );
  }
}
