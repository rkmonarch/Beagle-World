import 'package:flutter/material.dart';
import 'package:Beagle_Community/providers/screen_provider.dart';
import 'package:Beagle_Community/providers/wallet_state_provider.dart';
import 'package:Beagle_Community/views/home.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WalletStateProvider()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Phantom Dart Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}
