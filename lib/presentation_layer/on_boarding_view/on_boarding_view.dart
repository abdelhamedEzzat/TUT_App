import 'package:clean_arcicalcutre/domain_layer/models.dart';
import 'package:clean_arcicalcutre/presentation_layer/on_boarding_view/view_model/onboarding_viewmodel.dart';
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

  final OnboardingViewModel _viewModel = OnboardingViewModel();
  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      builder: (context, snapshot) {
        return _getContantWidget(snapshot.data);
      },
      stream: _viewModel.outPutSliderViewObject,
    );
  }

  Widget _getContantWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
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
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
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
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginView);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
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
                  _pageController.animateToPage(_viewModel.goPrevious(),
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
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: _getProberCircle(
                      i,
                      sliderViewObject.currentIndex,
                    ))
            ],
          ),

          //Right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_viewModel.goNext(),
                      duration: const Duration(
                          microseconds: ConstantApp.breviousIconDelay),
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

  Widget _getProberCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.embtyCircleIcon);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIcon);
    }
  }

  @override
  void dispose() {
    _viewModel.despose();
    super.dispose();
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
