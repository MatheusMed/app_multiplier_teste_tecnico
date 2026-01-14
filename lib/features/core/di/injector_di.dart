import 'package:app_multiplier_teste_tecnico/features/core/network/connectivity/i_connectivity_service.dart';
import 'package:app_multiplier_teste_tecnico/features/core/network/connectivity/imp/connectivity_plus_service.dart';
import 'package:app_multiplier_teste_tecnico/features/core/network/http/i_http_service.dart';
import 'package:app_multiplier_teste_tecnico/features/core/network/http/imp/http_service_imp.dart';
import 'package:app_multiplier_teste_tecnico/features/core/storage/i_local_storage.dart';
import 'package:app_multiplier_teste_tecnico/features/core/storage/imp/shared_preferences_storage.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/data/datasources/i_get_list_pokemon_datasource.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/data/datasources/imp/remote/get_list_pokemon_datasource_imp.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/data/repositories/get_list_pokemon_repository_imp.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/repositories/i_get_list_pokemon_repository.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/usecases/i_get_list_pokemon_usecase.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/domain/usecases/imp/get_pokemon_imp_usecase.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/state/bloc/home_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InjectorDi {
  static Future<void> init() async {
    final inject = GetIt.instance;

    inject.registerLazySingleton<Dio>(() => Dio());

    inject.registerLazySingleton<IHttpService>(
      () => HttpServiceImp(inject.get()),
    );

    inject.registerLazySingleton<IGetListPokemonUsecase>(
      () => GetPokemonImpUsecase(inject.get()),
    );

    inject.registerLazySingleton<IGetListPokemonRepository>(
      () => GetListPokemonRepositoryImp(inject.get()),
    );
    inject.registerLazySingleton<IGetListPokemonDatasource>(
      () => GetListPokemonDatasourceImp(inject.get()),
    );

    inject.registerLazySingleton<HomeBloc>(
      () => HomeBloc(inject.get(), inject.get(), inject.get()),
    );

    final prefs = await SharedPreferences.getInstance();

    inject.registerLazySingleton<SharedPreferences>(() => prefs);

    inject.registerLazySingleton<ILocalStorage>(
      () => SharedPreferencesStorage(inject.get()),
    );

    inject.registerLazySingleton<Connectivity>(() => Connectivity());

    inject.registerLazySingleton<IConnectivityService>(
      () => ConnectivityPlusService(inject.get()),
    );
  }
}
