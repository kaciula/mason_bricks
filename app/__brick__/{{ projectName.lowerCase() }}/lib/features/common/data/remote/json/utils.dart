{{#useDio}}import 'package:dio/dio.dart';

String mapErrorDetails(DioException e) {
  String errorDetails = '${e.requestOptions.method} ${e.requestOptions.uri}';
  if (e.response != null && e.response?.data != null) {
    errorDetails += '\n\n${e.response!.data}';
  }
  if (e.error is Error) {
    errorDetails += '\n\n${(e.error as Error).stackTrace}';
  }
  errorDetails += '\n\n${e.stackTrace}';
  return errorDetails;
}{{/useDio}}

String mapGeneralErrorDetails(dynamic e, dynamic stackTrace) {
  String errorDetails = e.toString();
  errorDetails += '\n\n$stackTrace';
  return errorDetails;
}





