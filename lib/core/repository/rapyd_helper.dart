import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/core/utils/video_call_settings.dart';
import 'package:random_string/random_string.dart';

class RapydAPI {
  String baseURL = 'https://sandboxapi.raphyd.net/v1';
  RapydAPI({required this.dio});
  Dio dio;
  createWallet() async {
    var walletBody = {
      'first_name': "TESTER",
      'last_name': "last",
      'type': 'person'
    };
    try {
      var response = await sl<FirebaseFunctions>()
          .httpsCallable('createWallet')
          .call({'body': walletBody});
      print(response.data);
    } catch (e) {
      return e;
    }
  }

  Future<Map<String, String>> _getHeaders(String httpMethod, String urlPath,
      {dynamic body = ''}) async {
    String timeStamp =
        ((DateTime.now().millisecondsSinceEpoch) / 1000).round().toString();
    var salt = randomString(randomBetween(8, 16), from: 97, to: 122);

    var toSign = httpMethod.toLowerCase() +
        urlPath +
        salt +
        timeStamp +
        rapydaccesskey +
        secretKey;
    if (body.isNotEmpty) toSign += jsonEncode(body);
    var signature = _getSignature(toSign);

    return {
      'content-type': 'application/json',
      'access_key': rapydaccesskey,
      'timestamp': timeStamp,
      'salt': salt,
      'signature': signature
    };
  }

  _getSignature(String toSign) {
    var key = ascii.encode(secretKey);
    var toSign_ = ascii.encode(toSign);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256

    var hmacSha256_ = hmacSha256.convert(toSign_);
    var ss = hex.encode(hmacSha256_.bytes);
    var tt = ss.codeUnits;
    var signature = base64.encode(tt);
    return signature;
  }
}
