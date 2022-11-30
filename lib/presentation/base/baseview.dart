import 'dart:async';
import 'package:mvvm_project/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {
  StreamController inputStateStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    inputStateStreamController.close();
  }
}

abstract class BaseViewModelInput {
  void start();

  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutput {
  Stream<FlowState> get outputState;
}
