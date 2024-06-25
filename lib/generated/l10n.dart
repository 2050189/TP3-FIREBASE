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

  /// `Welcome!`
  String get welcomeReg {
    return Intl.message(
      'Welcome!',
      name: 'welcomeReg',
      desc: '',
      args: [],
    );
  }

  /// `Please sign up.`
  String get instructionReg {
    return Intl.message(
      'Please sign up.',
      name: 'instructionReg',
      desc: '',
      args: [],
    );
  }

  /// `Sign up!`
  String get signup {
    return Intl.message(
      'Sign up!',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Existing account?`
  String get existingAccount {
    return Intl.message(
      'Existing account?',
      name: 'existingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get helloLog {
    return Intl.message(
      'Hello!',
      name: 'helloLog',
      desc: '',
      args: [],
    );
  }

  /// `Please log in.`
  String get instructionLog {
    return Intl.message(
      'Please log in.',
      name: 'instructionLog',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get login {
    return Intl.message(
      'Sign in with Google',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `No account?`
  String get noAccount {
    return Intl.message(
      'No account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `2 characters minimum`
  String get hintUsername {
    return Intl.message(
      '2 characters minimum',
      name: 'hintUsername',
      desc: '',
      args: [],
    );
  }

  /// `4 characters minimum`
  String get hintPassword {
    return Intl.message(
      '4 characters minimum',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Rewrite your password`
  String get hintConf {
    return Intl.message(
      'Rewrite your password',
      name: 'hintConf',
      desc: '',
      args: [],
    );
  }

  /// `Add your first task!`
  String get toastFirstTask {
    return Intl.message(
      'Add your first task!',
      name: 'toastFirstTask',
      desc: '',
      args: [],
    );
  }

  /// `Hi, {Username}!`
  String hiUser(Object Username) {
    return Intl.message(
      'Hi, $Username!',
      name: 'hiUser',
      desc: '',
      args: [Username],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Create a task`
  String get createTask {
    return Intl.message(
      'Create a task',
      name: 'createTask',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `{Percentage}% done`
  String percDone(Object Percentage) {
    return Intl.message(
      '$Percentage% done',
      name: 'percDone',
      desc: '',
      args: [Percentage],
    );
  }

  /// `Time left : {Percentage}%`
  String percTimeSpent(Object Percentage) {
    return Intl.message(
      'Time left : $Percentage%',
      name: 'percTimeSpent',
      desc: '',
      args: [Percentage],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Edit the task`
  String get editProgress {
    return Intl.message(
      'Edit the task',
      name: 'editProgress',
      desc: '',
      args: [],
    );
  }

  /// `Select a date`
  String get selectDate {
    return Intl.message(
      'Select a date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Name of the task`
  String get nameTask {
    return Intl.message(
      'Name of the task',
      name: 'nameTask',
      desc: '',
      args: [],
    );
  }

  /// `Create the task`
  String get create {
    return Intl.message(
      'Create the task',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Ex : Math exam`
  String get hintTask {
    return Intl.message(
      'Ex : Math exam',
      name: 'hintTask',
      desc: '',
      args: [],
    );
  }

  /// `Select an image`
  String get selectImg {
    return Intl.message(
      'Select an image',
      name: 'selectImg',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get photoLibrary {
    return Intl.message(
      'Library',
      name: 'photoLibrary',
      desc: '',
      args: [],
    );
  }

  /// `No network. Please check your Internet connection and refresh the page.`
  String get noNetwork {
    return Intl.message(
      'No network. Please check your Internet connection and refresh the page.',
      name: 'noNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Password is different from the confirmation. Please recheck your fields.`
  String get psswdDiff {
    return Intl.message(
      'Password is different from the confirmation. Please recheck your fields.',
      name: 'psswdDiff',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password. Please recheck the field.`
  String get psswdInc {
    return Intl.message(
      'Incorrect password. Please recheck the field.',
      name: 'psswdInc',
      desc: '',
      args: [],
    );
  }

  /// `Username not found. Please recheck the field.`
  String get usernameNotFound {
    return Intl.message(
      'Username not found. Please recheck the field.',
      name: 'usernameNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Username too short. Please use at least 2 characters.`
  String get usernameTooShort {
    return Intl.message(
      'Username too short. Please use at least 2 characters.',
      name: 'usernameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password too short. Please use at least 4 characters.`
  String get psswdTooShort {
    return Intl.message(
      'Password too short. Please use at least 4 characters.',
      name: 'psswdTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Username taken. Please choose another one.`
  String get usernameTaken {
    return Intl.message(
      'Username taken. Please choose another one.',
      name: 'usernameTaken',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Name too short. Please use at least 2 characters.`
  String get tasknameTooShort {
    return Intl.message(
      'Name too short. Please use at least 2 characters.',
      name: 'tasknameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Name taken. Please choose another one.`
  String get tasknameTaken {
    return Intl.message(
      'Name taken. Please choose another one.',
      name: 'tasknameTaken',
      desc: '',
      args: [],
    );
  }

  /// `Name empty. Please write a name.`
  String get tasknameEmpty {
    return Intl.message(
      'Name empty. Please write a name.',
      name: 'tasknameEmpty',
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
      Locale.fromSubtags(languageCode: 'fr'),
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
