import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  size: 80,
                  color: Colors.teal,
                ),
                Icon(
                  Icons.scatter_plot_rounded,
                  size: 30,
                  color: Colors.green,
                )
              ],
            ),
            Text(
              'Stock Scan Parser',
              style: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
