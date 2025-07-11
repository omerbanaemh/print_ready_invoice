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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `PrintReady Invoice`
  String get printReady_invoice {
    return Intl.message(
      'PrintReady Invoice',
      name: 'printReady_invoice',
      desc: '',
      args: [],
    );
  }

  /// `Project Details`
  String get project_details {
    return Intl.message(
      'Project Details',
      name: 'project_details',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the details below to generate your invoice`
  String get printReady_invoice_description {
    return Intl.message(
      'Fill in the details below to generate your invoice',
      name: 'printReady_invoice_description',
      desc: '',
      args: [],
    );
  }

  /// `Project Name`
  String get project_name {
    return Intl.message(
      'Project Name',
      name: 'project_name',
      desc: '',
      args: [],
    );
  }

  /// `E.g., Corporate Website Redesign`
  String get project_name_hint {
    return Intl.message(
      'E.g., Corporate Website Redesign',
      name: 'project_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Description (Optional)`
  String get project_description {
    return Intl.message(
      'Description (Optional)',
      name: 'project_description',
      desc: '',
      args: [],
    );
  }

  /// `Provide a brief description of project`
  String get project_description_hint {
    return Intl.message(
      'Provide a brief description of project',
      name: 'project_description_hint',
      desc: '',
      args: [],
    );
  }

  /// `Project Type`
  String get project_type {
    return Intl.message(
      'Project Type',
      name: 'project_type',
      desc: '',
      args: [],
    );
  }

  /// `Select the type of project`
  String get project_type_hint {
    return Intl.message(
      'Select the type of project',
      name: 'project_type_hint',
      desc: '',
      args: [],
    );
  }

  /// `Project Framework`
  String get project_framework {
    return Intl.message(
      'Project Framework',
      name: 'project_framework',
      desc: '',
      args: [],
    );
  }

  /// `Select the framework...`
  String get project_framework_hint {
    return Intl.message(
      'Select the framework...',
      name: 'project_framework_hint',
      desc: '',
      args: [],
    );
  }

  /// `Technologies Used`
  String get technologies_used {
    return Intl.message(
      'Technologies Used',
      name: 'technologies_used',
      desc: '',
      args: [],
    );
  }

  /// `Select Technologies...`
  String get technologies_used_hint {
    return Intl.message(
      'Select Technologies...',
      name: 'technologies_used_hint',
      desc: '',
      args: [],
    );
  }

  /// `Generate Invoice`
  String get generate_invoice {
    return Intl.message(
      'Generate Invoice',
      name: 'generate_invoice',
      desc: '',
      args: [],
    );
  }

  /// `AI Suggest Discount`
  String get ai_suggest_discount {
    return Intl.message(
      'AI Suggest Discount',
      name: 'ai_suggest_discount',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Preview`
  String get invoice_preview {
    return Intl.message(
      'Invoice Preview',
      name: 'invoice_preview',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message('Invoice', name: 'invoice', desc: '', args: []);
  }

  /// `Add Item`
  String get add_item {
    return Intl.message('Add Item', name: 'add_item', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Bill To:`
  String get bill_to {
    return Intl.message('Bill To:', name: 'bill_to', desc: '', args: []);
  }

  /// `Name:`
  String get name_ {
    return Intl.message('Name:', name: 'name_', desc: '', args: []);
  }

  /// `Type:`
  String get type {
    return Intl.message('Type:', name: 'type', desc: '', args: []);
  }

  /// `FrameWork:`
  String get framework {
    return Intl.message('FrameWork:', name: 'framework', desc: '', args: []);
  }

  /// `Technologies:`
  String get technologies {
    return Intl.message(
      'Technologies:',
      name: 'technologies',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get description {
    return Intl.message(
      'Description:',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Grand Total`
  String get grand_total {
    return Intl.message('Grand Total', name: 'grand_total', desc: '', args: []);
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Tax`
  String get tax {
    return Intl.message('Tax', name: 'tax', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Item`
  String get item {
    return Intl.message('Item', name: 'item', desc: '', args: []);
  }

  /// `Select a Project Type`
  String get select_project_type {
    return Intl.message(
      'Select a Project Type',
      name: 'select_project_type',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one technology`
  String get select_one_technology {
    return Intl.message(
      'Please select at least one technology',
      name: 'select_one_technology',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
