import 'package:e_pungli/main.dart';
import 'package:e_pungli/model/CPModel.dart';
import 'package:e_pungli/utils/WAColors.dart';
import 'package:e_pungli/utils/WADataGenerator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';

class NotificationScreen extends StatefulWidget {
  final bool isNotification;

  const NotificationScreen({Key? key, this.isNotification = false})
      : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<CPDataModel> notification = getNotificationDataModel();
  List<CPDataModel> todayDate = getTodayDateDataModel();
  bool markAllRead = false;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: widget.isNotification ? true : false,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: context.cardColor,
        leading: widget.isNotification
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,
                    color: appStore.isDarkModeOn ? white : black),
                iconSize: 18,
              )
            : null,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: black, width: 1)),
        title: Text("Notification", style: boldTextStyle(size: 18)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            8.height,
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color:
                    appStore.isDarkModeOn ? Color(0xFF1A2857) : Color(0xffeaf2ff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: WAPrimaryColor),
                    child: Image.asset(
                      'images/walletApp/wa_transfer.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  16.width,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Information!",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: boldTextStyle(),
                        ),
                        8.height,
                        Text(
                          "Depositing money into the account will take about 5 min due to a problem with the service  provider, thank you.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: WAPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16, width: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Hari ini',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    markAllRead = !markAllRead;
                    setState(() {});
                  },
                  child: Text(
                    !markAllRead ? "Tandai semua yang terbaca" : "Tandai semua belum dibaca",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff2972ff),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notification.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                CPDataModel data = notification[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: markAllRead
                                  ? WAPrimaryColor
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: data.bgColor!),
                        child: Image.asset(data.image!, fit: BoxFit.cover),
                      ),
                      16.width,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              data.currencyName!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(size: 14),
                            ),
                            SizedBox(height: 4, width: 16),
                            Text(
                              data.currencyUnit!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(size: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '20 Apr 2021',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: boldTextStyle(),
                ),
              ],
            ),
            8.height,
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: todayDate.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                CPDataModel data = todayDate[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: data.bgColor!),
                        child: Image.asset(data.image!, fit: BoxFit.cover),
                      ),
                      16.width,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              data.currencyName!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(size: 14),
                            ),
                            SizedBox(height: 4, width: 16),
                            Text(
                              data.currencyUnit!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(size: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
