import 'package:clean_arcicalcutre/presentation_layer/resorces/assets_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/color_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/constant_manager.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/routes_manager.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/strings_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

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
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _splashScreenList.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_splashScreenList[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.loginView);
                },
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_getPreviousIndex(),
                      duration:
                          Duration(microseconds: ConstantApp.breviousIconDelay),
                      curve: Curves.bounceInOut);
                },
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIcons),
                )),
          ),

          // circler indecator
          Row(
            children: [
              for (int i = 0; i < _splashScreenList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProberCircle(i),
                )
            ],
          ),

          //Right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_getNextIndex(),
                      duration:
                          Duration(microseconds: ConstantApp.breviousIconDelay),
                      curve: Curves.bounceInOut);
                },
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIcons),
                )),
          ),
        ],
      ),
    );
  }

  Widget _getProberCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.embtyCircleIcon);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIcon);
    }
  }

  int _getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _splashScreenList.length;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _splashScreenList.length) {
      nextIndex = 0;
    }
    return nextIndex;
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
        SvgPicture.asset(_sliderObject.image)
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
