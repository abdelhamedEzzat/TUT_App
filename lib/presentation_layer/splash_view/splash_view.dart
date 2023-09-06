import 'package:clean_arcicalcutre/presentation_layer/resorces/assets_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/color_manger.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
          child: Image(
        image: AssetImage(ImageAssets.splashLogo),
      )),
    );
  }
}
