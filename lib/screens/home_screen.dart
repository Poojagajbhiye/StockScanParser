import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/models/scans_list.dart';
import 'package:stock_scan_parser/screens/splash_screen.dart';
import 'package:stock_scan_parser/widgets/scan_tiles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: FutureBuilder(
            future: Provider.of<ScansList>(context, listen: false).init(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == 'success') {
                  return const ScanTiles();
                } else {
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                }
              } else {
                return const SplashScreen();
              }
            }),
      ),
    );
  }
}
