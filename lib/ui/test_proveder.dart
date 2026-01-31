import 'package:fire_base_project2/proveder/counter_proveder.dart';
import 'package:fire_base_project2/proveder/theme_proveder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProveder extends StatelessWidget {
  const TestProveder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            Text('Test Proveder'),
            Text('Test Proveder ${context.watch<CounterProveder>().count}'),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProveder>().increment();
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProveder>().decrement();
              },
              child: const Text('Decrement'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeProvider>().toggleTheme(true);
              },
              child: const Text('Chenge theme by provider'),
            ),
            Checkbox(
              value: true,
              onChanged: (value) =>
                  context.read<ThemeProvider>().toggleTheme(value!),
            ),
            Switch(
              value: context.watch<ThemeProvider>().themeMode == ThemeMode.dark,
              onChanged: (value) =>
                  context.read<ThemeProvider>().toggleTheme(value),
            ),
          ],
        ),
      ),
    );
  }
}
