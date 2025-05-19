import 'package:evently/ui/auth/register_screen.dart';
import 'package:evently/ui/home/home_screen.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/';
  TextEditingController emailControler =TextEditingController();
  TextEditingController passControler =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Padding(
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
                  padding: const EdgeInsets.only(top: 24.0),
                  child: TextFormField(controller: emailControler,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.mail,color: AppColor.greyColor,),
                        hintStyle: TextStyle(color: Color(0xff898F9C)),
                        hintText:  AppLocalizations.of(context)!.email,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(controller: passControler,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.lock,color: AppColor.greyColor,),
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Color(0xff898F9C),
                        ),
                        hintStyle: TextStyle(color: Color(0xff898F9C)),
                        hintText:  AppLocalizations.of(context)!.password,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Spacer(),
                      InkWell(
                          //todo navigate
                          child: Text(
                        AppLocalizations.of(context)!.forget_password,
                        style: AppStylse.bold16Primary,
                      )),
                    ],
                  ),
                ),
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
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
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
                        AppLocalizations.of(context)!.dont_have_account,
                        style: AppStylse.medium16Black,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(RegisterScreen.routeName);
                          }, child: Text(
                        AppLocalizations.of(context)!.create_account,
                            style: AppStylse.bold16Primary,
                          )),
                    ],
                  ),
                ),

                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xff1877F2),
                        fixedSize: Size(353, 50),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xff1877F2)),
                            borderRadius: BorderRadius.circular(16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAsset.googleIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            AppLocalizations.of(context)!.login_with_google,                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColor.primaryLight),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
     ] ),
    );
  }
}
