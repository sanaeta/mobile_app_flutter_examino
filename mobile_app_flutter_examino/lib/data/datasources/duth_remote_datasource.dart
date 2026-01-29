import 'package:dio/dio.dart';
import '../../general/network/dioClient.dart';
import '../models/userModel.dart';

class AuthRemoteDataSource {
  final Dio _dio = DioClient().dio;

  // Fonction de CONNEXION
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post('login', data: {
        'email': email,
        'password': password,
      });

      // On récupère le token ET l'utilisateur
      String token = response.data['token'];
      UserModel user = UserModel.fromJson(response.data['user']);

      return {'token': token, 'user': user};
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Erreur de connexion");
    }
  }

  // Fonction d'INSCRIPTION
  Future<UserModel> register(UserModel user, String password) async {
    try {
      // On prépare les données en ajoutant le mot de passe
      Map<String, dynamic> data = user.toJson();
      data['password'] = password;

      final response = await _dio.post('register', data: data);
      
      return UserModel.fromJson(response.data['user']);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Erreur d'inscription");
    }
  }
}