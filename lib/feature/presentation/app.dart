import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/common/generated/l10n.dart';
import 'package:product_list/feature/presentation/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../di.dart';
import 'bloc/locale_cubit/locale_cubit.dart';
import 'bloc/product_bloc/product_bloc.dart';
import 'bloc/tooltip_cubit/tooltip_cubit.dart';
import 'navigation.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => sl<ProductBloc>()..add(ProductGetList()),
        ),
        BlocProvider<TooltipCubit>(
          create: (context) => sl<TooltipCubit>(),
        ),
        BlocProvider<LocaleCubit>(
          create: (context) => sl<LocaleCubit>(),
        ),
      ],
      child: MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          locale: const Locale('ru'),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ru', 'RUS'),
          ],
          title: 'Product list',
          theme: AppTheme.lightTheme,
          home: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              if (state is LocaleChanged) {
                return Navigtion(
                  key: Key(state.lang),
                  indexNav: 2,
                );
              }
              return const Navigtion();
            },
          )),
    );
  }
}
