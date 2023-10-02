import 'package:bookly_app/view/constants/assets.dart';
import 'package:bookly_app/view/constants/exteintion.dart';
import 'package:bookly_app/view/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool isAnimate = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isAnimate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(MyAssets.logo),
          SizedBox(
            height: 70,
            child: Stack(alignment: Alignment.center, children: [
              AnimatedPositioned(
                bottom: isAnimate ? 50 : 0,
                curve: Curves.bounceOut,
                duration: const Duration(seconds: 3),
                onEnd: () => context.push(const HomeView()),
                child: const Text(
                  'Read free Books',
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
