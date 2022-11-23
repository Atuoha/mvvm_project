import 'dart:async';
import 'package:mvvm_project/domain/models/slider_object.dart';
import 'package:mvvm_project/presentation/base/baseview.dart';
import '../resources/assets_manager.dart';
import '../resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  var currentSlideIndex = 0;
  var slidesCount = 0;
  late List<SliderObject> _slides;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    slidesCount = _getSlidesCount();
    _slides = _getSlides();
    _postDataToView();
  }

  @override
  int toNextSlide() {
    var currentIndex = currentSlideIndex += 1;
    return currentIndex;
  }

  @override
  int toPreviousSlide() {
    var currentIndex = currentSlideIndex -= 1;
    return currentIndex;
  }

  @override
  int skipOnBoarding() {
    currentSlideIndex = slidesCount - 1;
    return currentSlideIndex;
  }

  @override
  void onPageChanged(int index) {
    currentSlideIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  int _getSlidesCount() {
    return _getSlides().length;
  }

  List<SliderObject> _getSlides() => [
        SliderObject(
          title: AppString.onBoardingTitle1,
          subTitle: AppString.onBoardingSubTitle1,
          imgUrl: ImageAsset.onBoardingImage1,
        ),
        SliderObject(
          title: AppString.onBoardingTitle2,
          subTitle: AppString.onBoardingSubTitle2,
          imgUrl: ImageAsset.onBoardingImage2,
        ),
        SliderObject(
          title: AppString.onBoardingTitle3,
          subTitle: AppString.onBoardingSubTitle3,
          imgUrl: ImageAsset.onBoardingImage3,
        ),
        SliderObject(
          title: AppString.onBoardingTitle4,
          subTitle: AppString.onBoardingSubTitle4,
          imgUrl: ImageAsset.onBoardingImage4,
        ),
      ];

  // send data to view
  _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        sliderObject: _slides[currentSlideIndex],
        numOfSlides: _slides.length,
        currentIndex: currentSlideIndex,
      ),
    );
  }
}

abstract class OnBoardingViewModelInput {
  void toNextSlide();

  void toPreviousSlide();

  void skipOnBoarding();

  void onPageChanged(int index);

  Sink get inputSliderViewObject; // a way to add something to the stream
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}
