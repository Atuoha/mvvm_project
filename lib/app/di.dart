import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_project/app/app_prefs.dart';
import 'package:mvvm_project/data/data_source/remote_data_source.dart';
import 'package:mvvm_project/data/network/app_api.dart';
import 'package:mvvm_project/data/network/dio_factory.dart';
import 'package:mvvm_project/data/network/network_info.dart';
import 'package:mvvm_project/data/repository/repository_impl.dart';
import 'package:mvvm_project/domain/repository/repository.dart';
import 'package:mvvm_project/domain/usecase/login_usecase.dart';
import 'package:mvvm_project/presentation/authentication/login/login_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // sharedPrefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // appPrefs instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(
      instance(),
    ),
  );

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementer(
      DataConnectionChecker(),
    ),
  );

  // dio factory instance
  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(instance()),
  );

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(
    () => AppServiceClient(dio),
  );

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(
      instance(),
    ),
  );

  // repository
  instance.registerLazySingleton<Repository>(
    () => RespositoryImpl(
      instance<RemoteDataSource>(),
      instance<NetworkInfo>(),
    ),
  );
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
