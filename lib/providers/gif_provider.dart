import 'package:flutter/material.dart';
import '../models/gif_model.dart';
import '../services/api_service.dart';

class GifProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<GifModel> _gifs = [];
  List<GifModel> _filteredGifs = [];

  List<GifModel> get gifs => _gifs;
  List<GifModel> get filteredGifs => _filteredGifs;

  Future<void> fetchGifs({String query = ""}) async {
    _gifs = await _apiService.fetchGifs(query: query);
    _filteredGifs = List.from(_gifs); // Reset filtered GIFs
    notifyListeners();
  }

  void filterGifs(String query) {
    if (query.isEmpty) {
      _filteredGifs = List.from(_gifs);
    } else {
      _filteredGifs = _gifs
          .where((gif) => gif.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
