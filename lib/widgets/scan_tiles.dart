import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/models/scans_list.dart';

import '../screens/scan_screen.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final stockScans = Provider.of<ScansList>(context).scansList;
    return ListView.builder(
        itemCount: stockScans.length,
        itemBuilder: (lvContext, index) => ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ScanScreen.routeName,
                  arguments: index,
                );
              },
              title: Text(stockScans[index].name),
              subtitle: Text(
                stockScans[index].tag,
                style: TextStyle(
                  color: stockScans[index].color == 'red'
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ));
  }
}
