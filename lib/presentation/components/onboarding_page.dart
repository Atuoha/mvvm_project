import 'package:flutter/material.dart';
import '../../domain/models/slider_object.dart';
import '../resources/values_manager.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.slide,
  }) : super(key: key);

  final SliderObject slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          slide.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: AppSize.s12),
        Text(
          slide.subTitle,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: AppSize.s12),
        Image.asset(slide.imgUrl),
      ],
    );
  }
}
