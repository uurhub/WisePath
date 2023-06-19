import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: 
          [Column(
            children: [
              // Load a Lottie file from your assets
              Lottie.network('https://assets3.lottiefiles.com/packages/lf20_lqge6px5.json'),
            Text('Meslektaşların ile İş Sorunlarını Paylaşabilir Ve Onlardan Birbirinden Değerli Fikirler Alabilirsin',

            textAlign: TextAlign.center,
            style:Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
            ),
            
            ],
          ),
        ],
      ),
    ),
    );
  }
}