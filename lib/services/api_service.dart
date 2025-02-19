import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/gif_model.dart';

class ApiService {
  static const String baseUrl = "https://api.giphy.com/v1/gifs";
  static const String apiKey = "XZCqhXpKyupZjTAeDDaIHnnd3VifgZm6";

  final Dio _dio = Dio();

  Future<List<GifModel>> fetchGifs({String query = ""}) async {
    try {
      final response = await _dio.get(
        "$baseUrl/${query.isEmpty ? 'trending' : 'search'}",
        queryParameters: {
          "api_key": apiKey,
          "q": query,
          "limit": 10
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data["data"];
        return data.map((json) => GifModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load GIFs");
      }
    } catch (e) {
      throw Exception("Error fetching GIFs: $e");
    }
  }
}
