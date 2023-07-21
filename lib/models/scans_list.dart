import 'package:flutter/material.dart';
import 'package:stock_scan_parser/models/scan.dart';
import 'package:stock_scan_parser/services/stock_scan_service.dart';

class ScansList with ChangeNotifier {
  List<Scan> scansList = [];
  bool viewSubCriteria = false;

  Future<dynamic> init() async {
    final dynamic data = await getScansData() as dynamic;
    if (data != null) {
      for (var scan in data) {
        Scan scanObj = Scan(
          id: scan['id'],
          name: scan['name'],
          tag: scan['tag'],
          color: scan['color'],
          criteria: scan['criteria'],
        );
        scansList.add(scanObj);
      }
      return 'success';
    } else {
      return 'failure';
    }
  }

  void switchList() {
    viewSubCriteria = true;
    notifyListeners();
  }
}
