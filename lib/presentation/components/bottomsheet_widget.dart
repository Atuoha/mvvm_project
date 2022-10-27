import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../domain/models/slider_object.dart';
import '../onboarding/onboarding_view_model.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.slidesCount,
    required this.currentSlideIndex,
    required this.viewModel,
    required this.pageController,
    required this.launch,
  });

  final int slidesCount;
  final int currentSlideIndex;
  final OnBoardingViewModel viewModel;
  final PageController pageController;
  final Function launch;

  void skipOnBoarding() {
    viewModel.skipOnBoarding();
  }

  void toNextSlide() {
    var page = viewModel.toNextSlide();
    pageController.animateToPage(
      page,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
    );
  }

  void toPreviousSlide() {
    var page = viewModel.toPreviousSlide();
    pageController.animateToPage(
      page,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s100,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => currentSlideIndex != slidesCount - 1
                  ? skipOnBoarding()
                  : launch(),
              child: Text(
                currentSlideIndex != slidesCount - 1 ? 'Skip' : 'Launch',
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
                    dotsCount: slidesCount,
                    position: double.parse(currentSlideIndex.toString()),
                    decorator: const DotsDecorator(
                      activeColor: Colors.white,
                      color: Colors.white70,
                    ),
                  ),
                  currentSlideIndex != slidesCount - 1
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
