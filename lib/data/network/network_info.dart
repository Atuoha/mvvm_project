import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final DataConnectionChecker _dataConnectionChecker;

  NetworkInfoImplementer(this._dataConnectionChecker);

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}
