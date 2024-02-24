import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_paper_sissors/controller/home_controller.dart';
import 'package:rock_paper_sissors/ui/dash_board.dart';
import 'package:rock_paper_sissors/util/color.dart';
import 'package:rock_paper_sissors/util/enum.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: AppColor.onBg,
              ));
        }),
        actions: [
          Visibility(
            visible: controller.startGame.value == true,
            child: FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                setState(() {
                  controller.retry(setState);
                });
              },
              child: const Icon(Icons.refresh),
            ),
          )
        ],
      ),
      backgroundColor: AppColor.bg,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerCard(
              text: 'Read The Rules',
              onTap: () {
                Navigator.pushNamed(Get.context!, '/rule');
              },
            ),
            DrawerCard(
              text: 'Return to Home',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    Get.context!, '/', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: controller.startGame.value == true
          ? ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Player',
                        style: context.textTheme.bodyLarge?.copyWith(
                            color: AppColor.onBg, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Computer',
                        style: context.textTheme.bodyLarge?.copyWith(
                            color: AppColor.onBg, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${controller.playerScore}',
                        style: context.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: AppColor.onBg),
                      ),
                      Text(
                        '${controller.computerScore}',
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: AppColor.onBg),
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10),
                ],
              ),
              controller.startGame.value == false
                  ? Text(
                      textAlign: TextAlign.center,
                      'Computer',
                      style: context.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColor.onBg))
                  : ImageCard(link: controller.list.first['link']),
              Text(
                textAlign: TextAlign.center,
                'VS',
                style: context.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.onBg),
              ),
              controller.startGame.value == false
                  ? Text(
                      textAlign: TextAlign.center,
                      'You',
                      style: context.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColor.onBg))
                  : ImageCard(
                      link: controller.type == RPS.rock
                          ? 'rock'
                          : controller.type == RPS.paper
                              ? 'paper'
                              : controller.type == RPS.scissors
                                  ? 'scissors'
                                  : 'rock',
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickCard(
                    text: 'Rock',
                    link: 'rock',
                    onTap: () {
                      setState(() {
                        if (controller.playerScore.value > 9 ||
                            controller.computerScore.value > 9) {
                          controller.gameDialogue(setState);
                        } else {
                          controller.type = RPS.rock;
                          controller.pcType = PC.player;
                          controller.shuffleList();
                          controller.checkWDL(setState);
                        }
                      });
                    },
                  ),
                  ClickCard(
                    text: 'Paper',
                    link: 'paper',
                    onTap: () {
                      setState(() {
                        if (controller.playerScore.value > 9 ||
                            controller.computerScore.value > 9) {
                          controller.gameDialogue(setState);
                        } else {
                          controller.type = RPS.paper;
                          controller.pcType = PC.player;
                          controller.shuffleList();
                          print(controller.playerScore.value);
                          print(controller.computerScore.value);
                          controller.checkWDL(setState);
                        }
                      });
                    },
                  ),
                  ClickCard(
                    text: 'Scissors',
                    link: 'scissors',
                    onTap: () {
                      setState(() {
                        if (controller.playerScore.value > 9 ||
                            controller.computerScore.value > 9) {
                          controller.gameDialogue(setState);
                        } else {
                          controller.type = RPS.scissors;
                          controller.pcType = PC.player;
                          controller.shuffleList();
                          controller.checkWDL(setState);
                        }
                      });
                    },
                  ),
                ],
              ),
            ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Computer',
                      textAlign: TextAlign.start,
                      style: context.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColor.onBg),
                    ).paddingSymmetric(vertical: 40),
                    Text(
                      'VS',
                      textAlign: TextAlign.start,
                      style: context.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColor.onBg),
                    ),
                    Text(
                      'YOU',
                      textAlign: TextAlign.start,
                      style: context.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColor.onBg),
                    ).paddingSymmetric(vertical: 40),
                  ],
                ),
                CusCard(
                    text: 'Start Game',
                    onTap: () {
                      setState(() {
                        controller.startGame.value = true;
                      });
                    }),
              ],
            ).paddingSymmetric(vertical: 10, horizontal: 10),
    );
  }
}

class ClickCard extends StatelessWidget {
  final String text;
  final String link;

  final Function() onTap;

  const ClickCard(
      {super.key, required this.text, required this.link, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.onBg)),
        child: Column(
          children: [
            Image.asset(
              'assets/images/$link.png',
              height: 120,
              width: 120,
            ).paddingSymmetric(vertical: 10),
            Text(
              text,
              style:
                  context.textTheme.bodyLarge?.copyWith(color: AppColor.onBg),
            ).paddingSymmetric(vertical: 10),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String link;

  const ImageCard({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$link.png',
      height: 220,
      width: 220,
    );
  }
}

class DrawerCard extends StatelessWidget {
  final String text;
  final Function() onTap;

  const DrawerCard({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColor.bg)),
      title: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(color: AppColor.bg),
      ),
    ).paddingSymmetric(vertical: 10, horizontal: 10);
  }
}
