import 'package:clean_arcicalcutre/presentation_layer/resorces/assets_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/color_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/strings_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController();

  int _currentIndex = 0;
  late final List<SliderObject> _splashScreenList = _getSliserData();
  List<SliderObject> _getSliserData() => [
        SliderObject(
            title: AppStrings.onBoardingTitle1,
            subTitle: AppStrings.onBoardingSubTitle1,
            image: ImageAssets.onBoardingLogo1),
        SliderObject(
            title: AppStrings.onBoardingTitle2,
            subTitle: AppStrings.onBoardingTitle2,
            image: ImageAssets.onBoardingLogo2),
        SliderObject(
            title: AppStrings.onBoardingTitle3,
            subTitle: AppStrings.onBoardingSubTitle3,
            image: ImageAssets.onBoardingLogo3),
        SliderObject(
            title: AppStrings.onBoardingTitle4,
            subTitle: AppStrings.onBoardingSubTitle4,
            image: ImageAssets.onBoardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          itemBuilder: (context, index) {
            // ON PORDIING PAGE
          },
          controller: _pageController,
          itemCount: _splashScreenList.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._sliderObject, {super.key});

  final SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}
