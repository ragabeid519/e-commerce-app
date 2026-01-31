import 'package:fire_base_project2/auth/login_and_signup_page.dart';
import 'package:fire_base_project2/auth/login.dart';
import 'package:fire_base_project2/auth/signup.dart';
import 'package:fire_base_project2/firebase_options.dart';
import 'package:fire_base_project2/generated/l10n.dart';
import 'package:fire_base_project2/proveder/cart_provider.dart';
import 'package:fire_base_project2/proveder/lang_provider.dart';
import 'package:fire_base_project2/proveder/theme_proveder.dart';
import 'package:fire_base_project2/ui/cart_items.dart';
import 'package:fire_base_project2/ui/favorite_page.dart';
import 'package:fire_base_project2/ui/my_home_page.dart';
import 'package:fire_base_project2/ui/producr_app.dart';
import 'package:fire_base_project2/ui/profile_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'proveder/favorite_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug, // للتطوير
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LangProvider>(
          create: (context) => LangProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

///   ragabeid5111999@gmail.com

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
          'User is currently signed out!============================================',
        );
      } else {
        print(
          'user is signed in!=======================================================',
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<LangProvider>().currentLocale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(primarySwatch: Colors.blue),
      themeMode: context.watch<ThemeProvider>().themeMode,
      // home: ProductApp(),
      // TestApi(),
      home:
          FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified
          ? MyHomePage(email: '', password: '')
          : LoginAndSignup(),
      // home: MyHomePage(email: '', password: ''),
      routes: {
        '/home': (context) => MyHomePage(email: '', password: ''),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/loginandreg': (context) => LoginAndSignup(),
        '/profile': (context) => const ProfilePage(),
        '/product': (context) => const ProductApp(),
        '/cart': (context) => CartItems(),
        '/favorite': (context) => FavoritePage(),
      },
    );
  }
}


/*
flutter run
r Hot reload.
R Hot restart.
h List all available interactive commands.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).

*/