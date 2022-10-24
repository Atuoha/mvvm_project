import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'slider_object.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.slides,
    required this.currentSlideIndex,
    required this.skipOnBoarding,
    required this.toPreviousSlide,
    required this.toNextSlide,
  });

  final List<SliderObject> slides;
  final int currentSlideIndex;
  final Function skipOnBoarding;
  final Function toNextSlide;
  final Function toPreviousSlide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s100,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => skipOnBoarding(),
              child: Text(
                'Skip',
                style: getRegularStyle(
                  color: ColorManager.primaryColor,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: ColorManager.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentSlideIndex > 0
                      ? IconButton(
                          onPressed: () => toPreviousSlide(),
                          icon: Icon(
                            Icons.chevron_left,
                            color: ColorManager.white,
                          ),
                        )
                      : const SizedBox.shrink(),
                  DotsIndicator(
                    dotsCount: slides.length,
                    position: double.parse(currentSlideIndex.toString()),
                    decorator: const DotsDecorator(
                      activeColor: Colors.white,
                      color: Colors.white70,
                    ),
                  ),
                  currentSlideIndex != slides.length - 1
                      ? IconButton(
                          onPressed: () => toNextSlide(),
                          icon: Icon(
                            Icons.chevron_right,
                            color: ColorManager.white,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
