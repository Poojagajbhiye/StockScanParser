// tests
// check git repo

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/models/scans_list.dart';
import 'package:stock_scan_parser/screens/scan_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ScansList(),
      child: const StockScanParser(),
    ),
  );
}

class StockScanParser extends StatelessWidget {
  const StockScanParser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Scan Parser',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Stock Scans'),
      routes: {
        ScanScreen.routeName: (context) => const ScanScreen(),
      },
    );
  }
}
