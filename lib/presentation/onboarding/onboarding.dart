import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/onboarding/onboarding_view_model.dart';
import '../components/bottomsheet_widget.dart';
import '../components/onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  _stop() {
    _viewModel.dispose();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  void launch() {
    Navigator.of(context).pushReplacementNamed('');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, AsyncSnapshot<SliderViewObject> snapshot) =>
          _getContent(snapshot.data),
    );
  }

  Widget _getContent(SliderViewObject? sliderViewObject) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemCount: sliderViewObject!.numOfSlides,
        itemBuilder: (context, index) => OnBoardingPage(
          slide: sliderViewObject.sliderObject,
        ),
      ),
      bottomSheet: BottomSheetWidget(
        slidesCount: _viewModel.slidesCount,
        currentSlideIndex: _viewModel.currentSlideIndex,
        pageController: _pageController,
        viewModel: _viewModel,
        launch: launch,
      ),
    );
  }
}
