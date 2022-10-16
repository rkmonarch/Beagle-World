import 'package:Beagle_Community/Repository/nft_repository.dart';
import 'package:Beagle_Community/bloc/bloc/nft_bloc.dart';
import 'package:Beagle_Community/components/screens/quiz/quiz_screen.dart';
import 'package:Beagle_Community/components/screens/score/nft_page.dart';
import 'package:Beagle_Community/main.dart';
import 'package:Beagle_Community/providers/question_controller.dart';
import 'package:Beagle_Community/resources/app_constant.dart';
import 'package:Beagle_Community/resources/appwrite.dart';
import 'package:Beagle_Community/resources/logger.dart';
import 'package:Beagle_Community/views/home.dart';
// import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phantom_connect/phantom_connect.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    String wallet = storage.read("PKEY");
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
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              // Spacer(),
              Text(
                "50 /${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
              Container(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      claimNFT(walletAddress: "3dTSLCGStegkuoU6dc75DbRdJk4rKV3d5ZCZdSWbTcQv").then((value) {
                        if (value.claimedAddresses != null) {
                          Get.to(NFT(
                              nft_address: value.claimedAddresses.toString()));
                        }
                      });
                    },
                    child: Text("Check Rewards")),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
