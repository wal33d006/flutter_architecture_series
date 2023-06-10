import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:part_six/domain/failures/network_failure.dart';

class NetworkRepository {
  // get put post delete
  // Take a URL string as parameter
  // and return Map<String, dynamic> as json
  // And do exception handling

  Future<Either<NetworkFailure, dynamic>> get(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  NetworkFailure? _handleStatusCode(int code) {
    if (code == 401) {
      return NetworkFailure(error: 'Unauthorized');
    }
    return null;
  }
}
