part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  const LocaleState();

  @override
  List<Object> get props => [];
}

class LocaleInitial extends LocaleState {}

class LocaleLoading extends LocaleState {}

class LocaleChanged extends LocaleState {
  final String lang;

  const LocaleChanged(this.lang);
  @override
  List<Object> get props => [lang];
}
