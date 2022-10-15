import 'package:flutter/material.dart';
import 'package:Beagle_Community/components/screens/quiz/quiz_screen.dart';
import 'package:Beagle_Community/providers/question_controller.dart';
import 'package:Beagle_Community/resources/app_constant.dart';
import 'package:Beagle_Community/views/home.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    var score = _qnController.correctAns! * 10;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${_qnController.correctAns! * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: score >= 7 ? Colors.green : Colors.red),
                  onPressed: () {
                    // Get.to(
                    //   score >=7 ?
                    Home();
                  },
                  child: Text(score >= 7 ? "Get Rewards" : "Go Back")),
              const Spacer(
                flex: 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
