class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.currentIndex, this.numOfSlides, this.sliderObject);
}
