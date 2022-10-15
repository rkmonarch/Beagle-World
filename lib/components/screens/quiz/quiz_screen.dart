import 'package:flutter/material.dart';
import 'package:Beagle_Community/providers/question_controller.dart';
import 'package:Beagle_Community/providers/screen_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      body: Body(),
    );
  }
}
