// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get lang {
    return Intl.message(
      'en',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `rub.`
  String get rub {
    return Intl.message(
      'rub.',
      name: 'rub',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get dollar {
    return Intl.message(
      '\$',
      name: 'dollar',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Product list app`
  String get title_app {
    return Intl.message(
      'Product list app',
      name: 'title_app',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message(
      'Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `New product`
  String get new_product {
    return Intl.message(
      'New product',
      name: 'new_product',
      desc: '',
      args: [],
    );
  }

  /// `Create new product`
  String get create_new_product {
    return Intl.message(
      'Create new product',
      name: 'create_new_product',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Product list`
  String get product_list {
    return Intl.message(
      'Product list',
      name: 'product_list',
      desc: '',
      args: [],
    );
  }

  /// `List of purchased products`
  String get product_list_done {
    return Intl.message(
      'List of purchased products',
      name: 'product_list_done',
      desc: '',
      args: [],
    );
  }

  /// `So far nothing has been done`
  String get so_far_nothing_has_been_done {
    return Intl.message(
      'So far nothing has been done',
      name: 'so_far_nothing_has_been_done',
      desc: '',
      args: [],
    );
  }

  /// `So far empty. Add new product`
  String get so_far_empty {
    return Intl.message(
      'So far empty. Add new product',
      name: 'so_far_empty',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Editing`
  String get editing {
    return Intl.message(
      'Editing',
      name: 'editing',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `L.`
  String get liters {
    return Intl.message(
      'L.',
      name: 'liters',
      desc: '',
      args: [],
    );
  }

  /// `pcs.`
  String get pieces {
    return Intl.message(
      'pcs.',
      name: 'pieces',
      desc: '',
      args: [],
    );
  }

  /// `g.`
  String get gram {
    return Intl.message(
      'g.',
      name: 'gram',
      desc: '',
      args: [],
    );
  }

  /// `kg.`
  String get kgram {
    return Intl.message(
      'kg.',
      name: 'kgram',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
