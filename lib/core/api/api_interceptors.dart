import 'package:dio/dio.dart';
import 'package:zimro/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await CacheHelper.getToken();
    options.headers["Accept-Language"] = "en";

    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }
}
