import 'package:evently/firebase_utils.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/home/home_screen.dart';
import 'package:evently/models/my_user.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailControler = TextEditingController();

  TextEditingController passControler = TextEditingController();

  TextEditingController rePassControler = TextEditingController();

  TextEditingController nameControler = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool noShowPassword1 = true;

  bool noShowPassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
        ),
      ),
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
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                          controller: nameControler,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
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
                        child: TextFormField(
                          obscureText: noShowPassword1,
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
                                    noShowPassword1 == true
                                        ? noShowPassword1 = false
                                        : noShowPassword1 = true;
                                    print('object');
                                  });
                                },
                                child: Icon(
                                  noShowPassword1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xff898F9C),
                                ),
                              ),
                              hintStyle:
                                  const TextStyle(color: Color(0xff898F9C)),
                              hintText: AppLocalizations.of(context)!.password,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                          obscureText: noShowPassword2,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please enter password!';
                            }
                          },
                          controller: rePassControler,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColor.greyColor,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    noShowPassword2 == true
                                        ? noShowPassword2 = false
                                        : noShowPassword2 = true;
                                    print('object');
                                  });
                                },
                                child: Icon(
                                  noShowPassword2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xff898F9C),
                                ),
                              ),
                              hintStyle:
                                  const TextStyle(color: Color(0xff898F9C)),
                              hintText: AppLocalizations.of(context)!.password,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 24,
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
                    register();
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

  bool registr = false;
  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        registr = true;
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailControler.text,
          password: passControler.text,
        );
       MyUser myUser = MyUser(name: nameControler.text, email: emailControler.text,id:credential.user?.uid??'',);
       await FirebaseUtils.addUserToFireStore(myUser);
        var userProvider =Provider.of< UserProvider>(context,listen: false);
        userProvider.updateUser(myUser);
        if (registr) {
          Fluttertoast.showToast(
              msg: "Registered Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Fluttertoast.showToast(
              msg: "The account already exists for that email.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } catch (e) {
        print(e);
      }
      print('tttttttttttttttttttttt');
    }
  }
}
