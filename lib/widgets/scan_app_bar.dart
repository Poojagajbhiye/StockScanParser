import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/models/scans_list.dart';

class ScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScanAppBar({required this.scanIndex, super.key});
  final int scanIndex;

  @override
  Widget build(BuildContext context) {
    final scans = Provider.of<ScansList>(context).scansList;
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            scans[scanIndex].name,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            scans[scanIndex].tag,
            style: TextStyle(
              fontSize: 14,
              color:
                  scans[scanIndex].color == 'red' ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
