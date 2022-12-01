import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/common/state_renderer/state_renderer.dart';
import '../../resources/string_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

// LOADING STATE
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppString.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// ERROR STATE
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// CONTENT STATE
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;
}

// EMPTY STATE
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryFnc,
  ) {
    switch (runtimeType) {
      case LoadingState:
        if (getStateRendererType() == StateRendererType.POPUP_LOADING_STATE) {
          showPopUp(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        } else {
          // StateRendererType.FULL_SCREEN_LOADING_STATE
          return StateRenderer(
            retryActionFunction: retryFnc,
            stateRendererType: getStateRendererType(),
            message: getMessage(),
          );
        }

      case ErrorState:
        disMissDialog(context);
        if (getStateRendererType() == StateRendererType.POPUP_ERROR_STATE) {
          showPopUp(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        } else {
          // StateRendererType.FULL_SCREEN_ERROR_STATE
          return StateRenderer(
            retryActionFunction: retryFnc,
            stateRendererType: getStateRendererType(),
            message: getMessage(),
          );
        }

      case ContentState:
        disMissDialog(context);
        return contentScreenWidget;

      case EmptyState:
        return StateRenderer(
          retryActionFunction: retryFnc,
          stateRendererType: getStateRendererType(),
        );

      default:
        return contentScreenWidget;
    }
  }

  disMissDialog(BuildContext context) {
    if (isThereACurrentPopUp(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  isThereACurrentPopUp(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = ""}) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
            retryActionFunction: () {},
            stateRendererType: stateRendererType,
            message: message,
          ),
        ));
  }
}
