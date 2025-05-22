import 'package:evently/firebase_utils.dart';
import 'package:evently/models/my_user.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/auth/register_screen.dart';
import 'package:evently/ui/home/home_screen.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControler = TextEditingController();

  TextEditingController passControler = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool noShowPassword = true;
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
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
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter email';
                              }
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            controller: emailControler,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.mail,
                                  color: AppColor.greyColor,
                                ),
                                hintStyle:
                                    const TextStyle(color: Color(0xff898F9C)),
                                hintText: AppLocalizations.of(context)!.email,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            obscureText: noShowPassword,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'please enter password!';
                              }
                            },
                            controller: passControler,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColor.greyColor,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      noShowPassword == true
                                          ? noShowPassword = false
                                          : noShowPassword = true;
                                      print('object');
                                    });
                                  },
                                  child: Icon(
                                    noShowPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xff898F9C),
                                  ),
                                ),
                                hintStyle:
                                    const TextStyle(color: Color(0xff898F9C)),
                                hintText:
                                    AppLocalizations.of(context)!.password,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16))),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      const Spacer(),
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
                      fixedSize: const Size(353, 50),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: const Color(0xff1877F2),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
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
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.create_account,
                            style: AppStylse.bold16Primary,
                          )),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      signInWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xff1877F2),
                        fixedSize: const Size(353, 50),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xff1877F2)),
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
                          AppLocalizations.of(context)!.login_with_google,
                          style: const TextStyle(
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
      ]),
    );
  }

  bool loginbool = false;
  void login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailControler.text, password: passControler.text);
        MyUser? user = await FirebaseUtils.readUserFromFireStore(
            credential.user!.uid );
        if (user == null) {
          return;
        }
        var userProvider =Provider.of<UserProvider>(context,listen: false);
        userProvider.updateUser(user);
        loginbool = true;
        Fluttertoast.showToast(
            msg: "Login successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } catch (e) {}
      if (loginbool == false) {
        Fluttertoast.showToast(
            msg: "Wrong email or password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
