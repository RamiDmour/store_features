import 'package:dio/dio.dart';

final class HeadersInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, String> headers = await constructHeaders();
    options.headers.addAll(headers);
    return handler.next(options);
  }

  Future<Map<String, String>> constructHeaders() async {
    // String? authorization;

    // const storage = FlutterSecureStorage();
    // try {
    //   if (getIt.get<ApiToken>().accessToken case var token?) {
    //     authorization = token;
    //   } else {
    //     // secure storage can give you exception it's popuplar problem. This is the most popular resolve this problem
    //     try {
    //       String? accessType =
    //           await getIt.get<SecureStorageDataSource>().read(key: StorageKeys.tokenType);
    //       String? accessToken =
    //           await getIt.get<SecureStorageDataSource>().read(key: StorageKeys.accessToken);
    //       authorization =
    //           accessType != null && accessToken != null ? '$accessType $accessToken' : null;
    //       getIt.get<ApiToken>().tokenType = accessType;
    //       getIt.get<ApiToken>().token = accessToken;
    //     } on PlatformException {
    //       await storage
    //           .deleteAll(); //We deleting token on catch. if you remove this line on first start application can't to start
    //     }
    //   }
    // } catch (_) {

    // }
    Map<String, String> headers = {
      // ApiPaths.contentType: ApiPaths.appJson,
      // ApiPaths.accept: ApiPaths.appJson,
      // ApiPaths.hl: 'ru',
      // ApiPaths.xClientKey: PlatformInfo.isAndroid ? 'android' : 'ios',
      // if (authorization case var auth?) ApiPaths.authorization: auth,
    };
    return headers;
  }
}
