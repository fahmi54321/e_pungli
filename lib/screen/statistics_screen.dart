import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:e_pungli/component/WACategoriesComponent.dart';
import 'package:e_pungli/component/WAStatisticsChartComponent.dart';
import 'package:e_pungli/component/WAStatisticsComponent.dart';
import 'package:e_pungli/model/WalletAppModel.dart';
import 'package:e_pungli/utils/WADataGenerator.dart';
import 'package:e_pungli/utils/WAWidgets.dart';


class StatisticScreen extends StatefulWidget {
  static String tag = '/StatisticScreen';

  @override
  StatisticScreenState createState() => StatisticScreenState();
}

class StatisticScreenState extends State<StatisticScreen> {
  List<WATransactionModel> categoriesList = waCategoriesList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Statisktik laporan', style: boldTextStyle(color: Colors.black, size: 20)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WAStatisticsComponent(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Grafik', style: boldTextStyle(size: 20, color: black)),
                    16.height,
                    Container(
                      width: 100,
                      height: 50,
                      child: DropdownButtonFormField(
                        value: overViewList[0],
                        isExpanded: true,
                        decoration: waInputDecoration(bgColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 8)),
                        items: overViewList.map((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!, style: boldTextStyle(size: 14)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          //
                        },
                      ),
                    ),
                  ],
                ).paddingOnly(left: 16, right: 16, top: 16),
                WAStatisticsChartComponent(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Kategori laporan', style: boldTextStyle(size: 20, color: black)),
                    Icon(Icons.play_arrow, color: Colors.grey),
                  ],
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Column(
                  children: categoriesList.map((categoryItem) {
                    return WACategoriesComponent(categoryModel: categoryItem);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
