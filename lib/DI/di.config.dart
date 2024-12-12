// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../datasource_contract/news_datasource.dart' as _i4;
import '../datasource_implementation/news_api_datasource_impl.dart' as _i5;
import '../repository_contract/news_repository.dart' as _i6;
import '../repository_implementation/newsrepository_impl.dart' as _i7;
import '../shared/api/api_manager.dart' as _i3;
import '../ui/category_details/view_model/CategoryDetailsViewModel.dart' as _i8;

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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.NewsDataSource>(
        () => _i5.NewsApiDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.NewsRepository>(
        () => _i7.NewsRepositoryImpl(gh<_i4.NewsDataSource>()));
    gh.factory<_i8.CategoryDetailsViewModel>(
        () => _i8.CategoryDetailsViewModel(gh<_i6.NewsRepository>()));
    return this;
  }
}
