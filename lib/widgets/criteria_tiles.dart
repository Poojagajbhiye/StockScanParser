import 'package:flutter/gestures.dart';
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
    final scansListProvider = Provider.of<ScansList>(context, listen: false);

    List<InlineSpan> criteriaTextSpans(int index, String text) {
      List<InlineSpan> textSpans = [];
      final Map<String, dynamic> variables = scanCriteria[index]['variable'];
      text.split(' ').forEach((subStr) {
        if (subStr.contains('\$')) {
          variables.forEach((key, value) {
            if (key == subStr) {
              value['type'] == 'value'
                  ? subStr = value['values'][0].toString()
                  : subStr = value['default_value'].toString();
              subStr = '($subStr)';
              textSpans.add(
                TextSpan(
                  text: subStr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      scansListProvider.selectVariable(
                          value['type'],
                          value['values'],
                          value['parameter_name'],
                          value['default_value']);
                      scansListProvider.switchList();
                    },
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.0,
                    fontSize: 18,
                  ),
                ),
              );
            }
          });
          textSpans.add(const TextSpan(text: ' '));
        } else {
          subStr += ' ';
          textSpans.add(
            TextSpan(
              text: subStr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          );
        }
      });
      return textSpans;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: scanCriteria.length,
          itemBuilder: (lvContext, index) {
            return ListTile(
              title: scanCriteria[index]['type'] == 'variable'
                  ? RichText(
                      text: TextSpan(
                        children: criteriaTextSpans(
                            index, scanCriteria[index]['text']),
                      ),
                    )
                  : Text(scanCriteria[index]['text']),
            );
          }),
    );
  }
}
