// ignore: constant_identifier_names
enum RequestMethod { GET, POST, PUT, PATCH, DELETE }

final class ApiRequest {
  final String path;
  final RequestMethod method;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? data;
  final Function(int, int)? onSendCallback;
  final Function(int, int)? onReceiveCallback;

  ApiRequest({
    required this.path,
    required this.method,
    this.query,
    this.data,
    this.onSendCallback,
    this.onReceiveCallback,
  });
}
