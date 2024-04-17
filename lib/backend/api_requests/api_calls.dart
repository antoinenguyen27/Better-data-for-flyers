import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ViewUpdateCall {
  static Future<ApiCallResponse> call({
    String? flyerCampaignID = '',
    String? approximateLocation = '',
    String? preciseLocation = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'viewUpdate',
      apiUrl:
          'https://australia-southeast1-busky-2e2fc.cloudfunctions.net/increaseViewCounter',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'flyerCampaignID': flyerCampaignID,
        'approximateLocation': approximateLocation,
        'preciseLocation': preciseLocation,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
