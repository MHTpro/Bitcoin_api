import 'dart:convert';

import 'package:http/http.dart' as httpmethod;
import 'package:my_api/model/model.dart';

Future<MainModel> getRequest() async {
  final response = await httpmethod.get(
    Uri.https(
      "api.coindesk.com",
      "/v1/bpi/currentprice.json",
    ),
  );

  if (response.statusCode == 200) {
    return MainModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception(
      "Error:Request failed",
    );
  }
}
