import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stockmarketscreener/Models/TopGainersAndLossersModel/TopGainersAndLossersModel.dart';

class ApiService{
  Future<List<StockData>> fetchTopGainersStockData() async {
    final response = await http.get(Uri.parse(
        'https://www.nseindia.com/api/live-analysis-variations?index=gainers'));


    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['NIFTY']['data'];
      return data.map((item) => StockData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load stock data');
    }
  }


  Future<List<StockData>> fetchTopLoosersStockData() async {
    final response = await http.get(Uri.parse(
        'https://www.nseindia.com/api/live-analysis-variations?index=loosers'));


    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['NIFTY']['data'];
      return data.map((item) => StockData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load stock data');
    }
  }
}