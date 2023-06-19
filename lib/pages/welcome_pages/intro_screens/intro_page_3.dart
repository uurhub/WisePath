import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.network('https://assets4.lottiefiles.com/packages/lf20_aj6xq4lp.json'),


            SizedBox(height: 110),


            Text('Eğer henüz meslek sahibi değilsen ve kariyerin için desteğe ihtiyacın varsa gönüllü mentorlarla bir araya gelebilir veya uzman olduğun konuda gönüllü mentor olabilirsin ',

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