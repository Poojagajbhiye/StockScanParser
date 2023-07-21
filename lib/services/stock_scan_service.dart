import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

var url = Uri.parse('http://coding-assignment.bombayrunning.com/data.json');

Future<dynamic> getScansData() async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
