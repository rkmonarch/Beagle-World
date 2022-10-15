import 'package:flutter/material.dart';

class AboutBeagleScreen extends StatelessWidget {
  const AboutBeagleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Beagle Information"),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                Image.network(
                    "https://imgs.search.brave.com/ZwRv76KWsefVhhLYsyNL6uRQKgDA07c8Y7R77uzMXAA/rs:fit:664:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC50/XzQtM2ZQRUY2blZr/Sm52aEJ2SWhBSGFG/UyZwaWQ9QXBp"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Beagle is an excellent hunting dog and loyal companion, it is also happy-go-lucky, funny, and cute. The Beagle's fortune is in his adorable face, with its big brown or hazel eyes set off by long, houndy ears set low on a broad head.",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                    "https://imgs.search.brave.com/dIypDMitODa8C0au_YPy0lY1fIm0rEYPcvFXCu1IRfc/rs:fit:632:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC56/VWJIQTA5ajNXdHQ0/cEdJR0h6QTJRSGFG/aiZwaWQ9QXBp"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Two varieties: under 13 inches at the shoulder & between 13 and 15 inches.\nColours: lemon, red and white, and tricolor.\nQualities: curious, clever, and energetic hounds\nFamily Friendly",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                    "https://imgs.search.brave.com/3r0W_-_pM6-jtLlrkulZHUcHRguY-GYy1iOnBpD9HpE/rs:fit:844:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC50/WThKMWhrZWk2QVZ3/Zmd4dHgyS2NnSGFF/SyZwaWQ9QXBp"),
                SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "What To Expect When Caring For a Beagle\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      TextSpan(
                        text:
                            "\nOwning a dog is not just a privilege; it’s a responsibility. They depend on us for, at minimum, food and shelter, and deserve much more. When you take a dog into your life, you need to understand the commitment that dog ownership entails. Beagles have a low maintenance, short smooth coat. They are low shedders. Adopt, enjoy and be happy!",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }
}
