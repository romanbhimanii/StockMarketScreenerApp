import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockmarketscreener/ApiService/ApiService.dart';
import 'package:stockmarketscreener/Models/TopGainersAndLossersModel/TopGainersAndLossersModel.dart';
import 'package:stockmarketscreener/Screens/TechinicalViewScreen/TechinicalViewScreen.dart';
import 'package:stockmarketscreener/Utils/AppColors.dart';
import 'package:stockmarketscreener/Utils/Utils.dart';

class TopGainersStocksScreens extends StatefulWidget {
  const TopGainersStocksScreens({super.key});

  @override
  State<TopGainersStocksScreens> createState() => _TopGainersStocksScreensState();
}

class _TopGainersStocksScreensState extends State<TopGainersStocksScreens> {
  List<StockData>? stockData;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchTopGainersData();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      fetchTopGainersData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchTopGainersData() async {
    final data = await ApiService().fetchTopGainersStockData();
    setState(() {
      stockData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leadingWidth: 50,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.textColor,
                size: 20,
              ),
            ),
          ),
        ),
        title: Utils.text(
            text: "Top Gainers Stocks",
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        backgroundColor: AppColors.backGroundColor,
        actions: [
          IconButton(onPressed: () {
            Get.bottomSheet(
              backgroundColor: Colors.grey.shade800.withOpacity(1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Utils.text(
                              text: "About",
                              color: AppColors.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                            IconButton(onPressed: () {
                              Get.back();
                            }, icon: const Icon(Icons.close,color: Colors.grey,size: 20,),)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.white38,
                          height: 0,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            Utils.text(
                                text: 'Top Gainers Stocks',
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor,
                                fontSize: 15
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Utils.text(
                                text: "Screener for today's Top Gainer Stocks on BSE and NSE.",
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, icon: const Icon(Icons.info_outline,color: Colors.grey,size: 19,))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchTopGainersData,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Utils.text(
                              text: 'Scrip',
                              color: Colors.grey,
                              fontSize: 11
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.text(
                              text: 'LTP',
                              color: Colors.grey,
                              fontSize: 11
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.text(
                              text: 'Open Price',
                              color: Colors.grey,
                              fontSize: 11
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.text(
                              text: 'High Price',
                              color: Colors.grey,
                              fontSize: 11
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: stockData == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: stockData!.length,
                itemBuilder: (context, index) {
                  final stock = stockData![index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
                        child: InkWell(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 140,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Utils.text(
                                        text: stock.symbol,
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Utils.text(
                                        text: stock.ltp,
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Utils.text(
                                        text: stock.openPrice,
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Utils.text(
                                        text: stock.highPrice,
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Get.to(CompanyProfileWidgetScreen(stock.symbol));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey.shade800.withOpacity(0.5),
                        height: 1,
                      )
                    ],
                  );
                },
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
