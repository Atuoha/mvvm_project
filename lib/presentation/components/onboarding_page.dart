import 'package:flutter/material.dart';
import '../../domain/models/slider_object.dart';
import '../resources/values_manager.dart';

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