import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rock_paper_sissors/util/enum.dart';

class HomeController extends GetxController {
  RPS type = RPS.rock;

  PC pcType = PC.player;

  RxBool startGame = false.obs;

  RxList list = [
    {'link': 'paper', 'type': RPS.paper, 'pcTYpe': PC.computer},
    {'link': 'paper', 'type': RPS.paper, 'pcTYpe': PC.computer},
    {'link': 'paper', 'type': RPS.paper, 'pcTYpe': PC.computer},
    {'link': 'rock', 'type': RPS.rock, 'pcTYpe': PC.computer},
    {'link': 'rock', 'type': RPS.rock, 'pcTYpe': PC.computer},
    {'link': 'rock', 'type': RPS.rock, 'pcTYpe': PC.computer},
    {'link': 'rock', 'type': RPS.rock, 'pcTYpe': PC.computer},
    {'link': 'scissors', 'type': RPS.scissors, 'pcTYpe': PC.computer},
    {'link': 'scissors', 'type': RPS.scissors, 'pcTYpe': PC.computer},
    {'link': 'scissors', 'type': RPS.scissors, 'pcTYpe': PC.computer},
    {'link': 'scissors', 'type': RPS.scissors, 'pcTYpe': PC.computer},
  ].obs;

  shuffleList() {
    list.shuffle(Random());
    update();
  }

  RxInt playerScore = 0.obs;
  RxInt computerScore = 0.obs;

  ///checking that win draw or loss
  checkWDL(setState) {
    ///draw
    if (list.first['type'] == type) {
      print('Draw');
      if (computerScore.value > 9 || playerScore.value > 9) {
        gameDialogue(setState);
      }
    }

    /// rock paper combo
    else if (list.first['type'] == RPS.rock && type == RPS.paper) {
      print('Player Wins');
      playerScore.value++;
      if (computerScore.value > 9 || playerScore.value > 9) {
        gameDialogue(setState);
      }
    } else if (list.first['type'] == RPS.paper && type == RPS.rock) {
      print('Computer Wins');
      computerScore.value++;
      if (computerScore.value > 9 || playerScore.value > 9) {
        gameDialogue(setState);
      }
    }

    /// scissor rock combo

    else if (list.first['type'] == RPS.rock && type == RPS.scissors) {
      print('Computer Wins');
      computerScore.value++;
      if (computerScore.value > 9 || playerScore.value > 9) {
        gameDialogue(setState);
      }
      ;
    } else if (list.first['type'] == RPS.scissors && type == RPS.rock) {
      print('Player Wins');
      playerScore.value++;
      if (computerScore.value > 9 || playerScore.value > 9) {
        gameDialogue(setState);
      }
    }

    /// scissor paper combo
    else if (list.first['type'] == RPS.scissors && type == RPS.paper) {
      print('Computer Wins');
      computerScore.value++;
      if (computerScore.value > 9 || playerScore.value > 9) {
        gameDialogue(setState);
      }
    } else if (list.first['type'] == RPS.paper && type == RPS.scissors) {
      print('Player Wins');
      playerScore.value++;
      if (computerScore.value > 9 || playerScore.value > 9) {
        gameDialogue(setState);
      }
    }
  }

  retry(setState) {
    computerScore.value = 0;
    playerScore.value = 0;
    shuffleType(setState);
    shuffleList();
    update();
  }

  gameDialogue(setState) {
    Get.dialog(SimpleDialog(
      title: const Text('GameOver'),
      children: [
        Lottie.asset(
          computerScore.value > 9
              ? 'assets/animations/lose.json'
              : playerScore.value > 9
                  ? 'assets/animations/win.json'
                  : computerScore.value == playerScore.value
                      ? 'assets/animations/draw.json'
                      : "",
          height: 200,
        ),
        Text(
          computerScore.value > 9
              ? 'Computer Win!'
              : playerScore.value > 9
                  ? 'You Won!'
                  : computerScore.value == playerScore.value
                      ? 'Its a Draw'
                      : "",
          textAlign: TextAlign.center,
          style: Get.context!.textTheme.titleSmall?.copyWith(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  retry(setState);
                  Navigator.pop(Get.context!);
                });
              },
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(Get.context!);
              },
              child: const Text('OK'),
            ),
          ],
        )
      ],
    ));
  }

  shuffleType(setState) {
    if (type == RPS.rock) {
      setState(() {
        type = RPS.paper;
      });
    } else if (type == RPS.paper) {
      setState(() {
        type = RPS.scissors;
      });
    } else if (type == RPS.scissors) {
      setState(() {
        type = RPS.rock;
      });
    }
  }
}
