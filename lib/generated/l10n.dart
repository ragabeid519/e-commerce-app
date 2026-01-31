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

  /// `Test Api`
  String get title {
    return Intl.message('Test Api', name: 'title', desc: '', args: []);
  }

  /// `Select Language`
  String get Select_Language {
    return Intl.message(
      'Select Language',
      name: 'Select_Language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message('English', name: 'en', desc: '', args: []);
  }

  /// `Arabic`
  String get ar {
    return Intl.message('Arabic', name: 'ar', desc: '', args: []);
  }

  /// `Update Text`
  String get update_text {
    return Intl.message('Update Text', name: 'update_text', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forget Password`
  String get forgetpass {
    return Intl.message(
      'Forget Password',
      name: 'forgetpass',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginwithgoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginwithgoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get loginwithfacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'loginwithfacebook',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Register with Google`
  String get registerwithgoogle {
    return Intl.message(
      'Register with Google',
      name: 'registerwithgoogle',
      desc: '',
      args: [],
    );
  }

  /// `Register with Facebook`
  String get registerwithfacebook {
    return Intl.message(
      'Register with Facebook',
      name: 'registerwithfacebook',
      desc: '',
      args: [],
    );
  }

  /// `Register with Email`
  String get registerwithemail {
    return Intl.message(
      'Register with Email',
      name: 'registerwithemail',
      desc: '',
      args: [],
    );
  }

  /// `Email not valid`
  String get emailnotvalid {
    return Intl.message(
      'Email not valid',
      name: 'emailnotvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password not valid`
  String get passnotvalid {
    return Intl.message(
      'Password not valid',
      name: 'passnotvalid',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Login & Register`
  String get loginandreg {
    return Intl.message(
      'Login & Register',
      name: 'loginandreg',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkmode {
    return Intl.message('Dark Mode', name: 'darkmode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightmode {
    return Intl.message('Light Mode', name: 'lightmode', desc: '', args: []);
  }

  /// `Change Theme`
  String get changetheme {
    return Intl.message(
      'Change Theme',
      name: 'changetheme',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cart Items`
  String get cart_Items {
    return Intl.message('Cart Items', name: 'cart_Items', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Your cart is empty`
  String get empty_cart {
    return Intl.message(
      'Your cart is empty',
      name: 'empty_cart',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `Login & Sign Up`
  String get login_and_signup {
    return Intl.message(
      'Login & Sign Up',
      name: 'login_and_signup',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account and start shopping`
  String get signup_subtitle {
    return Intl.message(
      'Create a new account and start shopping',
      name: 'signup_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account and start shopping`
  String get login_subtitle {
    return Intl.message(
      'Login to your account and start shopping',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get field_required {
    return Intl.message(
      'Field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enter_your_username {
    return Intl.message(
      'Enter your username',
      name: 'enter_your_username',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Account already exists`
  String get account_exists {
    return Intl.message(
      'Account already exists',
      name: 'account_exists',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Already have an account ?  `
  String get already_have_an_account {
    return Intl.message(
      'Already have an account ?  ',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password - Password should be at least 6 characters long`
  String get weak_password {
    return Intl.message(
      'Weak Password - Password should be at least 6 characters long',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Register with Email and Password`
  String get registerwithemailandpass {
    return Intl.message(
      'Register with Email and Password',
      name: 'registerwithemailandpass',
      desc: '',
      args: [],
    );
  }

  /// `Register with Google and Password`
  String get registerwithgoogleandpass {
    return Intl.message(
      'Register with Google and Password',
      name: 'registerwithgoogleandpass',
      desc: '',
      args: [],
    );
  }

  /// `Register with Facebook and Password`
  String get registerwithfacebookandpass {
    return Intl.message(
      'Register with Facebook and Password',
      name: 'registerwithfacebookandpass',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled by user.`
  String get cancelled {
    return Intl.message(
      'Cancelled by user.',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get user_not_found {
    return Intl.message(
      'User not found',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrong_password {
    return Intl.message(
      'Wrong password',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Email not verified`
  String get verify_email {
    return Intl.message(
      'Email not verified',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email before logging in.\nThe Link may be in your spam folder.`
  String get please_verify_your_email {
    return Intl.message(
      'Please verify your email before logging in.\nThe Link may be in your spam folder.',
      name: 'please_verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. \nplease enter valid data. \nOR check your email and password make chore it is correct.`
  String get error_ms {
    return Intl.message(
      'An error occurred. \nplease enter valid data. \nOR check your email and password make chore it is correct.',
      name: 'error_ms',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google   `
  String get sign_in_with_google {
    return Intl.message(
      'Sign in with Google   ',
      name: 'sign_in_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?  `
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account ?  ',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Page`
  String get favorite {
    return Intl.message('Favorite Page', name: 'favorite', desc: '', args: []);
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
