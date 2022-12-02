// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../data/network/failure.dart';
import '../../resources/assets_manager.dart';
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
  String message;
  String title;
  Function? retryActionFunction;

  StateRenderer({
    Key? key,
    Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction,
    required this.stateRendererType,
  })  : message = message ?? AppString.loading,
        title = title ?? "",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getStateScreen(context),
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
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

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return SizedBox(
      width: AppSize.s180,
      child: ElevatedButton(
        onPressed: () {
          if (stateRendererType == StateRendererType.FULL_SCREEN_ERROR_STATE) {
            retryActionFunction?.call();
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Text(
          buttonTitle,
          style: getRegularStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _getPopupDialog(BuildContext context,
      {required List<Widget> children}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPadding.p14),
      ),
      elevation: AppSize.s2,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPadding.p14),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: AppSize.s12,
              offset: Offset(AppSize.s0, AppSize.s12),
            ),
          ],
        ),
        child: _getDialogContent(
          context,
          children: children,
        ),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context,
      {required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _getStateScreen(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();

      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsOnColumn(
          children: [
            _getAnimatedImage(JsonAsset.emptyImg),
            _getMessage(message),
          ],
        );

      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopupDialog(
          context,
          children: [
            _getAnimatedImage(JsonAsset.loadingImg),
          ],
        );

      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopupDialog(
          context,
          children: [
            _getAnimatedImage(JsonAsset.errorImg),
            _getMessage('url not found, try again later'),
            _getRetryButton('Ok', context)
          ],
        );

      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsOnColumn(
          children: [
            _getAnimatedImage(JsonAsset.loadingImg),
            _getMessage(message),
          ],
        );

      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsOnColumn(
          children: [
            _getAnimatedImage(JsonAsset.errorImg),
            _getMessage(message),
            _getRetryButton("Retry again", context)
          ],
        );

      default:
        return Container();
    }
  }

  Widget _getItemsOnColumn({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
