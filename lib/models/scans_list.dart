import 'package:flutter/material.dart';
import 'package:stock_scan_parser/models/scan.dart';
import 'package:stock_scan_parser/services/stock_scan_service.dart';

class ScansList with ChangeNotifier {
  List<Scan> scansList = [];
  bool viewSubCriteria = false;
  int selectedCriteria = 0;
  late String? selectedVariableType;
  late List<dynamic>? selectedVariableValues;
  late String? selectedVariableParamName;
  late int? selectedVariableDefaultVal;

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
    viewSubCriteria = !viewSubCriteria;
    notifyListeners();
  }

  void selectVariable(
    String? type,
    List<dynamic>? values,
    String? paramName,
    int? val,
  ) {
    selectedVariableType = type;
    selectedVariableValues = values;
    selectedVariableParamName = paramName;
    selectedVariableDefaultVal = val;
  }
}
