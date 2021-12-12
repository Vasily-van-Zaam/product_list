import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/common/generated/l10n.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());
  void changeLocale(String lang) async {
    emit(LocaleLoading());
    await S.load(Locale(lang));
    emit(LocaleChanged(lang));
  }
}
