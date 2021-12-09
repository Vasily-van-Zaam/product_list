import 'package:get_it/get_it.dart';
import 'package:product_list/feature/domain/use_cases/product_case/product_cases.dart';
import 'feature/domain/use_cases/tooltip_case/tooltip_cases.dart';

final sl = GetIt.instance;

int() async {
  // Bloc, Cubit

  // UseCases
  sl.registerSingleton(() => ProductCases(sl()));
}
