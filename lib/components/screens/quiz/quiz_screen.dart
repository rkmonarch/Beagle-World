import 'package:flutter/material.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
 final PhantomConnect? phantomConnectInstance;
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const QuizScreen({super.key,  this.phantomConnectInstance});
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
