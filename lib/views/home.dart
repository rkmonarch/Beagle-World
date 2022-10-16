import 'dart:async';
import 'package:Beagle_Community/main.dart';
import 'package:Beagle_Community/resources/chart.dart';
import 'package:Beagle_Community/resources/snackbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Beagle_Community/components/connected/connected.dart';
import 'package:Beagle_Community/components/not_connected/not_connected.dart';
import 'package:Beagle_Community/components/sidebar/sidebar.dart';
import 'package:Beagle_Community/providers/wallet_state_provider.dart';
import 'package:Beagle_Community/utils/logger.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final phantomConnectInstance = PhantomConnect(
    appUrl: "https://solgallery.vercel.app",
    deepLink: "dapp://phantomconnect.io",
  );
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();

    _handleIncomingLinks(context);
  }

  @override
  void dispose() {
    logger.w("Dispose");
    super.dispose();
    sub.cancel();
  }

  void _handleIncomingLinks(context) async {
    final provider = Provider.of<WalletStateProvider>(context, listen: false);
    try {
      sub = uriLinkStream.listen((Uri? link) {
        if (!mounted) return;
        Map<String, String> params = link?.queryParameters ?? {};
        logger.i("Params: $params");
        if (params.containsKey("errorCode")) {
          _showSnackBar(context,
              params["errorMessage"] ?? "Error connecting wallet", "error");
          logger.e(params["errorMessage"]);
        } else {
          switch (link?.path) {
            case '/connected':
              if (phantomConnectInstance.createSession(params)) {
                provider.updateConnection(true);
                _showSnackBar(context, "Connected to Wallet", "success");
              } else {
                _showSnackBar(context, "Error connecting to Wallet", "error");
              }
              break;
            case '/disconnect':
              setState(() {
                provider.updateConnection(false);
              });
              _showSnackBar(context, "Wallet Disconnected", "success");
              break;
            default:
              logger.i('unknown');
              _showSnackBar(context, "Unknown Redirect", "error");
          }
        }
      }, onError: (err) {
        logger.e('OnError Error: $err');
      });
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      logger.e("Error occured PlatfotmException");
      return;
    }
  }

  connectWallet() async {
    Uri launchUri = await phantomConnectInstance.generateConnectUri(
        cluster: 'devnet', redirect: '/connected');
    logger.d(launchUri);
    await launchUrl(
      launchUri,
      mode: LaunchMode.externalApplication,
    );
    storage.write("PKEY", phantomConnectInstance.userPublicKey);
    logger.wtf(storage.read("PKEY"));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletStateProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          actions: [
            Visibility(
              visible: !provider.isConnected,
              child: IconButton(
                  onPressed: () {
                    connectWallet();
                  },
                  icon: Icon(Icons.account_balance_wallet_outlined)),
            )
          ],
          centerTitle: false,
          title: const Text("Beagle"),
        ),
        drawer: provider.isConnected
            ? Sidebar(phantomConnectInstance: phantomConnectInstance)
            : null,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // CarouselSlider(
                //   items: [
                //     Image.asset("assets/images/dog4.jpg"),
                //     Image.asset("assets/images/dog2.jpg"),
                //     Image.asset("assets/images/dog3.jpg"),
                //   ],
                //   options: CarouselOptions(
                //     height: 180.0,
                //     enlargeCenterPage: true,
                //     autoPlay: true,
                //     aspectRatio: 16 / 9,
                //     reverse: false,
                //     autoPlayCurve: Curves.easeIn,
                //     enableInfiniteScroll: true,
                //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                //     viewportFraction: 0.8,
                //   ),
                // ),
                Image.asset(
                  "assets/images/dog6.jpg",
                  height: 200,
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "The beagle is a breed of small scent hound, similar in appearance to the much larger foxhound. The beagle was developed primarily for hunting hare known as beagling. ",
                  style: TextStyle(fontSize: 20),
                ),
                Divider(color: Colors.white, thickness: 1),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/dog2.jpg",
                  height: 200,
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "Possessing a great sense of smell and superior tracking instincts, the beagle is the primary breed used as a detection dog for prohibited agricultural imports and foodstuffs in quarantine around the world.",
                  style: TextStyle(fontSize: 20),
                ),
                Divider(color: Colors.white, thickness: 1),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/dWd.jpg",
                  height: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Get Exclusive Connection to the best in Industry Doctor and Mentors for your Beagle only on Beagle NFT",
                  style: TextStyle(fontSize: 20),
                ),
                Divider(color: Colors.white, thickness: 1),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "Below is chart for basic information about the breed",
                  style: TextStyle(fontSize: 20),
                ),
                Chart()
              ],
            ),
          ),
        ));
  }
}

_showSnackBar(BuildContext context, String message, String variant) {
  Color backgroundColor = Colors.blueAccent;
  if (variant == 'error') {
    backgroundColor = Colors.red.shade400;
  } else if (variant == 'success') {
    backgroundColor = Colors.green.shade500;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: backgroundColor,
      content: Text(message),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
