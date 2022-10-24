import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Row,
      body: PageView.builder(
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
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.slides,
    required this.currentSlideIndex,
  }) : super(key: key);

  final List<SliderObject> slides;
  final int currentSlideIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          slides[currentSlideIndex].title,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: AppSize.s12),
        Text(
          slides[currentSlideIndex].subTitle,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: AppSize.s12),
        Image.asset(slides[currentSlideIndex].imgUrl),
      ],
    );
  }
}

class SliderObject {
  final String title;
  final String subTitle;
  final String imgUrl;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.imgUrl,
  });
}
