import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/generated/l10n.dart';
import 'feature/data/datasources/datasources.dart';
import 'feature/data/repositories/product_repository_impl.dart';
import 'feature/domain/use_cases/product_case/product_cases.dart';
import 'feature/data/repositories/tolltip_repository_impl.dart';
import 'feature/domain/repositories/repositories.dart';
import 'feature/domain/use_cases/tooltip_case/tooltip_cases.dart';
import 'feature/presentation/bloc/product_bloc/product_bloc.dart';
import 'feature/presentation/bloc/tooltip_cubit/tooltip_cubit.dart';

final sl = GetIt.instance;

int() async {
  // Bloc, Cubit
  sl.registerFactory(
    () => ProductBloc(sl()),
  );

  sl.registerFactory(
    () => TooltipCubit(sl()),
  );
  // UseCases
  sl.registerLazySingleton(
    () => ProductCases(sl()),
  );
  sl.registerLazySingleton(
    () => TooltipCases(sl()),
  );
  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<TooltipRepository>(
    () => TooltipRepositoryImpl(sl()),
  );

  // Datasources
  sl.registerLazySingleton<ProductLocalStorageDataSource>(
    () => ProductLocalStorageDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<TooltipLocalStorageDataSource>(
    () => TooltipLocalStorageDataSourceImpl(sl()),
  );
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ]);
}
