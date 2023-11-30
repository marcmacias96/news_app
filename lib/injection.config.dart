// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:new_app/data/core/api_client/api_client.dart' as _i3;
import 'package:new_app/data/core/injectable_modules.dart' as _i7;
import 'package:new_app/data/news/news_repository.dart' as _i5;
import 'package:new_app/features/news/cubit/news_cubit.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.ApiClient>(() => injectableModule.client);
    gh.lazySingleton<_i4.Dio>(() => injectableModule.httpClient);
    gh.lazySingleton<_i5.NewsRepository>(
        () => _i5.NewsRepository(apiClient: gh<_i3.ApiClient>()));
    gh.factory<_i6.NewsCubit>(() => _i6.NewsCubit(gh<_i5.NewsRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i7.InjectableModule {}
