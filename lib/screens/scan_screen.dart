import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/models/scans_list.dart';
import 'package:stock_scan_parser/widgets/criteria_tiles.dart';
import 'package:stock_scan_parser/widgets/scan_app_bar.dart';
import 'package:stock_scan_parser/widgets/sub_criteria.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});
  static const routeName = '/scan-screen';

  @override
  Widget build(BuildContext context) {
    final int scanIndex = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: ScanAppBar(
          scanIndex: scanIndex,
        ),
        body: AnimatedSwitcher(
          duration: const Duration(seconds: 3),
          child: Provider.of<ScansList>(context).viewSubCriteria
              ? const SubCriteria()
              : CriteriaTiles(
                  scanIndex: scanIndex,
                ),
        ),
      ),
    );
  }
}
