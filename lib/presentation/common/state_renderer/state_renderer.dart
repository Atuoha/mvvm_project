// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../data/network/failure.dart';
import '../../resources/font_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

enum StateRendererType {
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE,
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  Failure failure;
  String message;
  String title;
  Function retryActionFunction;

  StateRenderer({
    Key? key,
    Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction,
    required this.stateRendererType,
  })  : message = message ?? AppString.loading,
        title = title ?? "",
        failure = failure ?? DefaultFailure(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getStateScreen(),
    );
  }

  Widget _getAnimatedImage() {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Image.asset(''),
    );
  }

  Widget _getMessage(String message) {
    return Text(
      message,
      style: getMediumStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }

  Widget _getStateScreen() {
    switch (stateRendererType) {
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsOnColumn(
          children: [],
        );
      case StateRendererType.POPUP_ERROR_STATE:
        return _getItemsOnColumn(
          children: [],
        );

      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsOnColumn(
          children: [],
        );

      case StateRendererType.POPUP_LOADING_STATE:
        return _getItemsOnColumn(
          children: [],
        );

      case StateRendererType.CONTENT_SCREEN_STATE:
        return _getItemsOnColumn(
          children: [],
        );

      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsOnColumn(
          children: [],
        );

      default:
        return Container();
    }
  }

  Widget _getItemsOnColumn({required List<Widget> children}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
