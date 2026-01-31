import 'package:fire_base_project2/components/bottomNavBar.dart';
import 'package:fire_base_project2/generated/l10n.dart';
import 'package:fire_base_project2/proveder/lang_provider.dart';
import 'package:fire_base_project2/proveder/theme_proveder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).profile),
          actions: [
            IconButton(
              onPressed: () {
                Locale currentLocale = context
                    .read<LangProvider>()
                    .currentLocale;
                if (currentLocale.languageCode == 'en') {
                  context.read<LangProvider>().changeLocale(const Locale('ar'));
                } else {
                  context.read<LangProvider>().changeLocale(const Locale('en'));
                }
              },
              icon: Icon(Icons.language),
            ),
            IconButton(
              onPressed: () {
                context.read<ThemeProvider>().themeMode == ThemeMode.light
                    ? context.read<ThemeProvider>().toggleTheme(true)
                    : context.read<ThemeProvider>().toggleTheme(false);
              },
              icon: Icon(Icons.brightness_6),
            ),
          ],
        ),
        bottomNavigationBar: Bottomnavbar(pageIndex: 2),
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/1.png'),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).username,
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).email,
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).phone,
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).address,
                prefixIcon: Icon(Icons.home),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Save profile changes
              },
              child: Text(S.of(context).save),
            ),
          ],
        ),
      ),
    );
  }
}
