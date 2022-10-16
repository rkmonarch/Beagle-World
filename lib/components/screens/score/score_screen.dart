import 'package:Beagle_Community/Repository/nft_repository.dart';
import 'package:Beagle_Community/components/screens/score/nft_page.dart';
import 'package:Beagle_Community/main.dart';
import 'package:Beagle_Community/providers/question_controller.dart';
import 'package:Beagle_Community/resources/app_constant.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

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
                      claimNFT(walletAddress: wallet).then((value) {
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
