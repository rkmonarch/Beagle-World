import 'package:flutter/material.dart';
import 'package:Beagle_Community/components/screens/quiz/quiz_screen.dart';
import 'package:Beagle_Community/components/screens/screens.dart';
import 'package:Beagle_Community/providers/screen_provider.dart';
import 'package:get/get.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:provider/provider.dart';

class Connected extends StatefulWidget {
  final PhantomConnect phantomConnectInstance;
  const Connected({super.key, required this.phantomConnectInstance});

  @override
  State<Connected> createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
  @override
  Widget build(BuildContext context) {
    final scrrenProvider = Provider.of<ScreenProvider>(context, listen: true);
    final walletAddrs = widget.phantomConnectInstance.userPublicKey;
    return Container(
        child: Container(
      child: _buildScreen(scrrenProvider.currentScreen, walletAddrs),
    ));
  }

  Widget _buildScreen(Screens screen, String walletAddress) {
    switch (screen) {
      case Screens.quiz:
        return QuizScreen();

      default:
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Connected to\n\n$walletAddress",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  width: 400,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(QuizScreen());
                      },
                      child: Text("Take a Quiz")),
                )
              ],
            ),
          ),
        );
    }
  }
}
