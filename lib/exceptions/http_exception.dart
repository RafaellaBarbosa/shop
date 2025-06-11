class HttpRequestException  implements Exception {
  final String msg;
  final int statusCode;

  HttpRequestException ({
    required this.msg,
    required this.statusCode,
  });

  @override
  String toString() => 'HttpException(msg: $msg, statusCode: $statusCode)';
}
