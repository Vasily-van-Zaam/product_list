import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/common/generated/l10n.dart';

import '../bloc/locale_cubit/locale_cubit.dart';

enum D { pieces }

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/splash.png',
                width: 100,
              ),
              const Text(
                'In developing',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MaterialButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(S.of(context).lang,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Icon(Icons.translate_sharp, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      switch (S.of(context).lang) {
                        case "en":
                          BlocProvider.of<LocaleCubit>(context)
                              .changeLocale('ru');
                          break;
                        case "ru":
                          BlocProvider.of<LocaleCubit>(context)
                              .changeLocale('en');
                          break;
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
