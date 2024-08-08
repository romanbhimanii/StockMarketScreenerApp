class StockData {
  final String symbol;
  final String series;
  final String openPrice;
  final String highPrice;
  final String lowPrice;
  final String ltp;
  final String prevPrice;
  final String netPrice;
  final String tradeQuantity;
  final String turnover;
  final String marketType;
  final String caExDt;
  final String caPurpose;
  final String perChange;


  StockData({
    required this.symbol,
    required this.series,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.ltp,
    required this.prevPrice,
    required this.netPrice,
    required this.tradeQuantity,
    required this.turnover,
    required this.marketType,
    required this.caExDt,
    required this.caPurpose,
    required this.perChange,
  });


  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      symbol: json['symbol'].toString(),
      series: json['series'].toString(),
      openPrice: json['open_price'].toString(),
      highPrice: json['high_price'].toString(),
      lowPrice: json['low_price'].toString(),
      ltp: json['ltp'].toString(),
      prevPrice: json['prev_price'].toString(),
      netPrice: json['net_price'].toString(),
      tradeQuantity: json['trade_quantity'].toString(),
      turnover: json['turnover'].toString(),
      marketType: json['market_type'].toString(),
      caExDt: json['ca_ex_dt'].toString(),
      caPurpose: json['ca_purpose'].toString(),
      perChange: json['perChange'].toString(),
    );
  }
}