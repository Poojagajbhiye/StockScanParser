import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/scans_list.dart';

class SubCriteria extends StatelessWidget {
  const SubCriteria({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ScansList>(context);
    final String? variableType = dataProvider.selectedVariableType;
    final List<dynamic>? variableValues = dataProvider.selectedVariableValues;
    final String? parameterName = dataProvider.selectedVariableParamName;
    final int? defaultVal = dataProvider.selectedVariableDefaultVal;
    ListView showValues() {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: variableValues!.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            variableValues[index].toString(),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    Padding showIndicator() {
      return Padding(
        padding: const EdgeInsets.all(12.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Set Parameters'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(parameterName!),
                SizedBox(
                  width: 20,
                  child: TextFormField(
                    initialValue: defaultVal.toString(),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Center(
        child: Column(
      children: [
        if (variableType == 'value') showValues(),
        if (variableType == 'indicator') showIndicator(),
        OutlinedButton(
          onPressed: () =>
              Provider.of<ScansList>(context, listen: false).switchList(),
          child: const Text('Back'),
        ),
      ],
    ));
  }
}
