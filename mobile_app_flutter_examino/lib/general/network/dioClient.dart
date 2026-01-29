import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api/', // IP spéciale pour l'émulateur Android vers ton localhost Laravel
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Ajoute un intercepteur pour débugger tes appels dans la console
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}