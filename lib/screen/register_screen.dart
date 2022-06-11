import 'package:e_pungli/screen/login_screen.dart';
import 'package:e_pungli/utils/WAColors.dart';
import 'package:e_pungli/utils/WAConstants.dart';
import 'package:e_pungli/utils/WAWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class RegisterPribadiScreen extends StatefulWidget {
  static String tag = '/RegisterPribadiScreen';

  @override
  RegisterPribadiScreenState createState() => RegisterPribadiScreenState();
}

class RegisterPribadiScreenState extends State<RegisterPribadiScreen> {
  var nikController = TextEditingController();
  var fullNameController = TextEditingController();
  var alamatController = TextEditingController();
  var alamatDomisiliController = TextEditingController();
  var emailController = TextEditingController();
  var noHpController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var namaOrganisasiController = TextEditingController();

  FocusNode namaOrganisasiFocusNode = FocusNode();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode nikFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode alamatFocusNode = FocusNode();
  FocusNode alamatDomisiliFocusNode = FocusNode();
  FocusNode noHpFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  FocusNode confirmPassWordFocusNode = FocusNode();

  int selectedValue = kodePribadi;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
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
    return Scaffold(
      body: Container(
        width: context.width(),
        height: context.height(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/walletApp/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              50.height,
              Text("Daftar akun baru",
                  style: boldTextStyle(size: 24, color: black)),
              Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      margin: EdgeInsets.only(top: 55.0),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: context.cardColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                50.height,
                                Text("Daftar Sebagai",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: RadioListTile<int>(
                                        title: Text(
                                          'Pribadi',
                                          style: boldTextStyle(size: 14),
                                        ),
                                        value: kodePribadi,
                                        groupValue: selectedValue,
                                        onChanged: (value) => setState(() =>
                                            selectedValue =
                                                value ?? kodePribadi),
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile<int>(
                                        title: Text(
                                          'Organisasi',
                                          style: boldTextStyle(size: 14),
                                        ),
                                        value: kodeOrganisasi,
                                        groupValue: selectedValue,
                                        onChanged: (value) => setState(() =>
                                            selectedValue =
                                                value ?? kodePribadi),
                                      ),
                                    ),
                                  ],
                                ),
                                16.height,
                                (selectedValue == kodeOrganisasi)
                                    ? BiodataOrganisasi(
                                        namaOrganisasiController:
                                            namaOrganisasiController,
                                        namaOrganisasiFocusNode:
                                            namaOrganisasiFocusNode,
                                      )
                                    : Container(),
                                Text("Nik", style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Masukkan nik disini',
                                      prefixIcon: Icons.family_restroom),
                                  textFieldType: TextFieldType.NAME,
                                  keyboardType: TextInputType.number,
                                  controller: nikController,
                                  focus: nikFocusNode,
                                  nextFocus: fullNameFocusNode,
                                ),
                                16.height,
                                Text("Nama lengkap",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Masukkan nama lengkap disini',
                                      prefixIcon:
                                          Icons.person_outline_outlined),
                                  textFieldType: TextFieldType.NAME,
                                  keyboardType: TextInputType.name,
                                  controller: fullNameController,
                                  focus: fullNameFocusNode,
                                  nextFocus: alamatFocusNode,
                                ),
                                16.height,
                                Text("Alamat lengkap",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Masukkan alamat lengkap disini',
                                      prefixIcon: Icons.location_city),
                                  textFieldType: TextFieldType.MULTILINE,
                                  keyboardType: TextInputType.multiline,
                                  controller: alamatController,
                                  focus: alamatFocusNode,
                                  nextFocus: alamatDomisiliFocusNode,
                                ),
                                16.height,
                                Text("Alamat domisili",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Masukkan alamat domisili disini',
                                      prefixIcon: Icons.location_city),
                                  textFieldType: TextFieldType.MULTILINE,
                                  keyboardType: TextInputType.multiline,
                                  controller: alamatDomisiliController,
                                  focus: alamatDomisiliFocusNode,
                                  nextFocus: emailFocusNode,
                                ),
                                16.height,
                                Text("Email", style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Masukkan email disini',
                                      prefixIcon: Icons.email_outlined),
                                  textFieldType: TextFieldType.EMAIL,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  focus: emailFocusNode,
                                  nextFocus: noHpFocusNode,
                                ),
                                16.height,
                                Text("No hp", style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Masukkan no hp disini',
                                      prefixIcon: Icons.phone),
                                  textFieldType: TextFieldType.PHONE,
                                  keyboardType: TextInputType.phone,
                                  controller: emailController,
                                  focus: noHpFocusNode,
                                  nextFocus: passWordFocusNode,
                                ),
                                16.height,
                                Text("Password",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Masukkan password disini',
                                      prefixIcon: Icons.lock_outline),
                                  suffixIconColor: WAPrimaryColor,
                                  textFieldType: TextFieldType.PASSWORD,
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  focus: passWordFocusNode,
                                  nextFocus: confirmPassWordFocusNode,
                                ),
                                16.height,
                                Text("Konfirmasi Password",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint:
                                          'Masukkan konfirmasi password disini',
                                      prefixIcon: Icons.lock_outline),
                                  suffixIconColor: WAPrimaryColor,
                                  textFieldType: TextFieldType.PASSWORD,
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  focus: confirmPassWordFocusNode,
                                ),
                                30.height,
                                AppButton(
                                        text: "Daftar akun",
                                        color: WAPrimaryColor,
                                        textColor: Colors.white,
                                        shapeBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        width: context.width(),
                                        onTap: () {
                                          LoginScreen().launch(context);
                                        })
                                    .paddingOnly(
                                        left: context.width() * 0.1,
                                        right: context.width() * 0.1),
                                30.height,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Sudah punya akun?',
                                        style: primaryTextStyle(
                                            color: Colors.grey)),
                                    4.width,
                                    Text('Masuk disini',
                                        style: boldTextStyle(
                                            color: appStore.isDarkModeOn
                                                ? white
                                                : black)),
                                  ],
                                ).onTap(() {
                                  finish(context);
                                }).center(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: boxDecorationRoundedWithShadow(30,
                          backgroundColor: context.cardColor),
                      child: Image.asset(
                        'images/walletApp/wa_app_logo.png',
                        height: 60,
                        color: appStore.isDarkModeOn ? white : black,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class BiodataOrganisasi extends StatelessWidget {
  const BiodataOrganisasi({
    Key? key,
    required this.namaOrganisasiController,
    required this.namaOrganisasiFocusNode,
    this.onTap,
  }) : super(key: key);

  final TextEditingController namaOrganisasiController;
  final FocusNode namaOrganisasiFocusNode;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nama organisasi", style: boldTextStyle(size: 14)),
        8.height,
        AppTextField(
          decoration: waInputDecoration(
              hint: 'Masukkan nama oranisasi disini', prefixIcon: Icons.work),
          textFieldType: TextFieldType.NAME,
          keyboardType: TextInputType.name,
          controller: namaOrganisasiController,
          focus: namaOrganisasiFocusNode,
        ),
        16.height,
        Text("Dokumen bukti wakil organisasi", style: boldTextStyle(size: 14)),
        8.height,
        AppTextField(
          decoration: waInputDecoration(
            hint: 'Klik untuk pilih file',
            prefixIcon: Icons.file_copy,
          ),
          textFieldType: TextFieldType.NAME,
          keyboardType: TextInputType.name,
          enabled: false,
          onTap: onTap,
        ),
      ],
    ).paddingBottom(16);
  }
}
