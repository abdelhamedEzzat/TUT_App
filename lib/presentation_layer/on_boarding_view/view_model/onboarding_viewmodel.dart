import 'dart:async';

import 'package:clean_arcicalcutre/domain_layer/models.dart';
import 'package:clean_arcicalcutre/presentation_layer/base/base_view_model.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/assets_manger.dart';

import '../../resorces/strings_manger.dart';

class OnboardingViewModel extends BaseViewModel
    implements OnboardingViewModelInputs, OnboardingViewModelOutPuts {
//Stream Controller from  view model to view
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  int _currentIndex = 0;
  late final List<SliderObject> _splashScreenList;
  @override

  // onBoarding View model  inputs
  void despose() {
    _streamController.close();
  }

  @override
  void start() {
    _splashScreenList = _getSliserData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _splashScreenList.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _splashScreenList.length;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inPutSlidersViewObject
  Sink get inPutSlidersViewObject => _streamController.sink;

  @override
  // TODO: implement outPutSliderViewObject
  Stream<SliderViewObject> get outPutSliderViewObject =>
      _streamController.stream.map((SliderViewObject) => SliderViewObject);

  // onboarding privete function

  void _postDataToView() {
    inPutSlidersViewObject.add(SliderViewObject(_currentIndex,
        _splashScreenList.length, _splashScreenList[_currentIndex]));
  }

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
}

// inputs mean that "orders " that are ViewModel Will Receved From view
abstract class OnboardingViewModelInputs {
  int goNext(); // when user click right arrow or swip left
  int goPrevious(); // when user click left arrow or swip right
  void onPageChanged(int index);

  //stream controller input
  Sink get inPutSlidersViewObject;
}

abstract class OnboardingViewModelOutPuts {
  //stream controller output
  Stream<SliderViewObject> get outPutSliderViewObject;
}
