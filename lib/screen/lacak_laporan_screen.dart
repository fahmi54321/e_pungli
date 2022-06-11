import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:e_pungli/utils/WAColors.dart';
import 'package:e_pungli/utils/WADataGenerator.dart';
import 'package:e_pungli/utils/WAWidgets.dart';

import '../main.dart';
import 'WAAddCreditionalScreen.dart';


class LacakLaporanScreen extends StatefulWidget {
  static String tag = '/LacakLaporanScreen';
  final isEditProfile;

  LacakLaporanScreen({this.isEditProfile});

  @override
  LacakLaporanScreenState createState() => LacakLaporanScreenState();
}

class LacakLaporanScreenState extends State<LacakLaporanScreen> {
  var fullNameController = TextEditingController();
  var contactNumberController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode contactNumberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
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
          title: Text(
            'Lacak laporan',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: context.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? white : black),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
                width: context.width(),
                // height: context.height(),
                decoration: boxDecorationWithShadow(backgroundColor: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temukan status terakhir laporan anda dengan memasukkana kode laporan', style: secondaryTextStyle(size: 18,),textAlign: TextAlign.center,),
                      16.height,
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.2), width: 0.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lacak', style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Masukkan beberapa kata disini',
                              ),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.name,
                              controller: fullNameController,
                              focus: fullNameFocusNode,
                            ),
                          ],
                        ),
                      ),
                      16.height,
                      AppButton(
                        color: WAPrimaryColor,
                        width: context.width(),
                        child: Text('Lacak', style: boldTextStyle(color: Colors.white)),
                        onTap: () {

                        },
                      ).cornerRadiusWithClipRRect(30).paddingOnly(left: context.width() * 0.1, right: context.width() * 0.1),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(color: WAPrimaryColor, shape: BoxShape.circle),
                    child: Icon(Icons.search, color: white, size: 60),
                  ),
                ],
              ),
            ],
          ).paddingTop(60),
        ),
      ),
    );
  }
}
