import 'package:flutter/material.dart';
import 'package:global2/eletroposto.dart';
import 'package:global2/api_services.dart';

class EletropostoProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Eletroposto> _eletropostos = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Eletroposto> get eletropostos => _eletropostos;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchEletropostos() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _eletropostos = await _apiService.fetchEletropostos();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
