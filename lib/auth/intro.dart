import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/auth/signin_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  }

  Widget _buildImage(String assetName) {
    double width = MediaQuery.of(context).size.width;
    return SvgPicture.asset('assets/icons/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
              titleWidget: const AutoSizeText(
                "Create an account",
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff164A70),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              body: "easily make an account, it takes 3 clicks!",
              image: _buildImage("login.svg"),
            ),
            PageViewModel(
              titleWidget: const AutoSizeText(
                "Report waste",
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff164A70),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              body: "take a picture, send a report win gifts and points!",
              image: _buildImage("report.svg"),
            ),
            PageViewModel(
              titleWidget: const AutoSizeText(
                "Track your consumption",
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff164A70),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              body: "and get statistics to avoid over consumption",
              image: _buildImage("track.svg"),
            ),
            PageViewModel(
              titleWidget: const AutoSizeText(
                "Post and share with others",
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff164A70),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              body:
                  "Join our echo friendly community and share your daily echo friendly activities",
              image: _buildImage("blog.svg"),
            ),
            PageViewModel(
              titleWidget: const AutoSizeText(
                "Donate to charities",
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff164A70),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              body:
                  "you don't need a product anymore? why throw it when you can donate it!",
              image: _buildImage("charity.svg"),
            ),
          ],
          onDone: () => _onIntroEnd(context),
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          back: const Icon(Icons.arrow_back),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Terminé',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ));
  }
}
