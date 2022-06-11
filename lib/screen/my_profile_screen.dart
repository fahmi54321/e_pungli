import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:e_pungli/screen/WAEditProfileScreen.dart';
import 'package:e_pungli/utils/WAColors.dart';
import 'package:e_pungli/utils/WAWidgets.dart';

import '../main.dart';

class MyProfileScreen extends StatefulWidget {
  static String tag = '/MyProfileScreen';

  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
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
          title: Text('Profil saya', style: boldTextStyle(color: Colors.black, size: 20)),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                waCommonCachedNetworkImage(
                  'https://vignette.wikia.nocookie.net/ultra/images/6/66/Emoticon_Ultraman.png/revision/latest?cb=20150730111204',
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ).cornerRadiusWithClipRRect(60),
                16.height,
                Text('Ultraman', style: boldTextStyle()),
                Text('ultraman@gmail.com', style: secondaryTextStyle()),
                16.height,
                SettingItemWidget(
                    title: 'Edit Profile',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      WAEditProfileScreen(isEditProfile: true).launch(context);
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Menu 2',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Menu 3',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Menu 4',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Dark Mode',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Switch(
                      value: appStore.isDarkModeOn,
                      activeColor: appColorPrimary,
                      onChanged: (s) {
                        appStore.toggleDarkMode(value: s);
                      },
                    ),
                    onTap: () {
                      //
                    }),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
