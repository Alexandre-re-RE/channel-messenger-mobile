import 'dart:convert';

import 'package:dio/dio.dart';

import 'constants.dart';

Future<bool> login({required String email, required String password}) async {
  final formData = FormData.fromMap({
    'email': email,
    'password': password,
  });

  final response = await Dio().post("${AppUrl}/me",
      data: formData,
      options: Options(headers: {
        "Device": true,
      }));
  return response.data["success"];
}


// final response = await Dio().post("${AppUrl}/channel/list",
                  //     options: Options(headers: {
                  //       "Device": true,
                  //       "Authorization":
                  //           "Basic ${base64.encode(utf8.encode("webmaster@alexandre.re:alexandre"))}"
                  //     }));
                  // print(response);