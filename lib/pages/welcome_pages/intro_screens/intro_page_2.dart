import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});
  
  

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.network('https://assets7.lottiefiles.com/packages/lf20_vvtkfqbo.json'),
            
            Text('Her Meslek Grubunun Birarada Bulunduğu Etkileşim Alanında Sosyal İletişim İçinde Bulunabilirsin ',

            textAlign: TextAlign.center,
            style:Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
            ),
            

          ],
        ),
      ),
    );
  }
} 