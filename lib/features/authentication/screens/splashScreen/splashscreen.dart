import 'package:clg/features/authentication/screens/login/login.dart';
import 'package:clg/features/authentication/screens/onboarding/onboarding.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>

    with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_)=> OnBoardingScreen(),
      ));
    });
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values
    );
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 356),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(TImages.appLogo,height: 100,width: 275,),
            ],
          ),
        )
    );
  }
}
