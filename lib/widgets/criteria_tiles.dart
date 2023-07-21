import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/models/scans_list.dart';

class CriteriaTiles extends StatelessWidget {
  const CriteriaTiles({required this.scanIndex, super.key});
  final int scanIndex;

  @override
  Widget build(BuildContext context) {
    final scanCriteria =
        Provider.of<ScansList>(context).scansList[scanIndex].criteria;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: scanCriteria.length,
          itemBuilder: (lvContext, index) {
            return ListTile(
              title: Text(scanCriteria[index]['text']),
              subtitle: scanCriteria[index]['type'] == 'variable'
                  ? GestureDetector(
                      onTap: () =>
                          Provider.of<ScansList>(context, listen: false)
                              .switchList(),
                      child: const Text(
                        'Click here for more info',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    )
                  : null,
            );
          }),
    );
  }
}
