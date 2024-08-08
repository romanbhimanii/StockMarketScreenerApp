import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockmarketscreener/Screens/BearrishScreens/TopLoosersScreens/TopLoosersScreens.dart';
import 'package:stockmarketscreener/Screens/BullishScreens/TopGainersStocksScreens/TopGainersStocksScreens.dart';
import 'package:stockmarketscreener/Utils/AppColors.dart';
import 'package:stockmarketscreener/Utils/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  TabController? _tabController;

  List<String> bullishTextList  = [
    "Top Gainers Stocks",
    "New 52 Week High",
    "Near 52 Week High",
    "High Volume High Gain",
    "Day Open Lowest Point of the Day",
    "Price Up & Volume Up"
  ];

  List<String> bearishTextList  = [
    "Top Losers Stocks",
    "New 52 Week Low",
    "Near 52 Week Low",
    "High Volume Top Losers",
    "Day Open Highest Point of the Day",
  ];

  List<String> neutralTextList  = [
    "Volume Shockers",
  ];

  List<String> bullishIconList = [
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
  ];

  List<String> bearishIconList = [
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
    "assets/Icons/topGainers.png",
  ];

  List<String> neutralIconList = [
    "assets/Icons/topGainers.png",
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
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
        title: Utils.text(
            text: "Price And Volume",
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        backgroundColor: AppColors.backGroundColor,
        bottom: TabBar(
          dividerHeight: 0.0,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          automaticIndicatorColorAdjustment: true,
          controller: _tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(0),
          indicatorPadding: const EdgeInsets.all(05),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            border: Border.all(
              color: const Color(0xFF00A9FF),
              width: 1,
            ),
          ),
          labelStyle: GoogleFonts.inter(
              color: const Color(0xFF00A9FF), fontSize: 15),
          unselectedLabelStyle: GoogleFonts.inter(
              color: Colors.grey, fontSize: 15),
          indicatorColor: AppColors.backGroundColor,
          tabs: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Tab(text: 'Bullish'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Tab(text: 'Bearish'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Tab(text: 'Neutral'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          firstTab(),
          secondTab(),
          thirdTab(),
        ],
      ),
    );
  }

  Widget firstTab() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        ListView.builder(
          itemCount: bullishTextList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 05),
            child: Column(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                   if(index == 0){
                     Get.to(const TopGainersStocksScreens());
                   }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image(image: AssetImage(bullishIconList[index]),height: 23,width: 23,),
                        const SizedBox(
                          width: 15,
                        ),
                        Utils.text(
                          text: bullishTextList[index],
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blueGrey.shade800.withOpacity(0.5),
                  height: 0,
                )
              ],
            ),
          );
        },),
      ],
    );
  }

  Widget secondTab() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        ListView.builder(
          itemCount: bearishTextList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 05),
              child: Column(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if(index == 0){
                        Get.to(const TopLoosersScreens());
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image(image: AssetImage(bearishIconList[index]),height: 23,width: 23,),
                          const SizedBox(
                            width: 15,
                          ),
                          Utils.text(
                              text: bearishTextList[index],
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.blueGrey.shade800.withOpacity(0.5),
                    height: 0,
                  )
                ],
              ),
            );
          },),
      ],
    );
  }

  Widget thirdTab() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        ListView.builder(
          itemCount: neutralTextList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 05),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image(image: AssetImage(neutralIconList[index]),height: 23,width: 23,),
                        const SizedBox(
                          width: 15,
                        ),
                        Utils.text(
                            text: neutralTextList[index],
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.blueGrey.shade800.withOpacity(0.5),
                    height: 0,
                  )
                ],
              ),
            );
          },),
      ],
    );
  }
}
