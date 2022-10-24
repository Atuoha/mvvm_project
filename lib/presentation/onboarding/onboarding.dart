import 'package:flutter/material.dart';
import '../components/bottomsheet_widget.dart';
import '../components/onboarding_page.dart';
import '../components/slider_object.dart';
import '../resources/assets_manager.dart';
import '../resources/string_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var currentSlideIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<SliderObject> slides = [
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

  void skipOnBoarding() {
    setState(() {
      currentSlideIndex = slides.length - 1;
    });
  }

  void toNextSlide() {
    var page = currentSlideIndex += 1;
    _pageController.animateToPage(page, duration: const Duration(seconds:3), curve: Curves.easeIn);
  }

  void toPreviousSlide() {
    var page = currentSlideIndex -= 1;
    _pageController.animateToPage(page, duration: const  Duration(seconds:3), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentSlideIndex = value;
          });
        },
        itemCount: slides.length,
        itemBuilder: (context, index) => OnBoardingPage(
          slides: slides,
          currentSlideIndex: currentSlideIndex,
        ),
      ),
      bottomSheet: BottomSheetWidget(
        slides: slides,
        currentSlideIndex: currentSlideIndex,
        skipOnBoarding: skipOnBoarding,
        toPreviousSlide: toPreviousSlide,
        toNextSlide: toNextSlide,
      ),
    );
  }
}
