import 'package:evently/ui/home/home_screen.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  TextEditingController emailControler =TextEditingController();
  TextEditingController passControler =TextEditingController();
  TextEditingController rePassControler =TextEditingController();
  TextEditingController nameControler =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColor.primaryLight,
        )),
      centerTitle: true,
      title: Text(
        AppLocalizations.of(context)!.register,
        style: AppStylse.medium20Primary,
      ),),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAsset.appLogoo,
                color: AppColor.primaryLight,
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(controller: nameControler,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColor.greyColor,
                      ),
                      hintStyle: TextStyle(color: Color(0xff898F9C)),
                      hintText: AppLocalizations.of(context)!.name,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ), Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(controller: emailControler,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: AppColor.greyColor,
                      ),
                      hintStyle: TextStyle(color: Color(0xff898F9C)),
                      hintText: AppLocalizations.of(context)!.email,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(controller: passControler,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColor.greyColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Color(0xff898F9C),
                      ),
                      hintStyle: TextStyle(color: Color(0xff898F9C)),
                      hintText: AppLocalizations.of(context)!.password,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(controller: rePassControler,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColor.greyColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Color(0xff898F9C),
                      ),
                      hintStyle: TextStyle(color: Color(0xff898F9C)),
                      hintText: AppLocalizations.of(context)!.re_password,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
             const SizedBox(height: 24,),
              FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: Size(353, 50),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Color(0xff1877F2),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    AppLocalizations.of(context)!.create_account,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.already_have_account,
                      style: AppStylse.medium16Black,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: AppStylse.bold16Primary,
                        )),
                  ],
                ),
              ),

            ],
          ),
        ),
      ]),
    );
  }
}
