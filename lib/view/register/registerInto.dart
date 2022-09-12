import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:tech_blog/view/my_cat.dart';
import 'package:validators/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class RegisterInto extends StatefulWidget {
  @override
  State<RegisterInto> createState() => _RegisterIntoState();
}

class _RegisterIntoState extends State<RegisterInto> {
  final _text = TextEditingController();
  final _textActive = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String _erorrEmail = "";
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/img/bot_tech.svg',
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: MyStrings.welcom,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'IranSans',
                      height: 2,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    _ShowModalBottomSheet(context, size, _erorrEmail);
                  },
                  child: const Text(
                    "ثبت نام / ورود",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IranSans',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _ShowModalBottomSheet(
      BuildContext context, Size size, String _erorrEmail) {
    bool emailCheck = false;
    // final Function(String) _erorrEmail;
    String _erorrEmail = "";
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: ((context) {
          return Padding(
            // jahate inke input bere bala keyboard.
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        MyStrings.insertYourEmail,
                        style: TextStyle(
                            fontFamily: "IranSans",
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          emailCheck = isEmail(value);
                        },
                        textAlign: TextAlign.center,
                        controller: _text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail_solid),
                          errorText: _validate ? 'ایمیل صحیح نمی باشد.' : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 2),
                          ),
                          counterStyle: TextStyle(color: Colors.red),
                          hintText: "rohi1386@yahoo.com",
                          hintStyle: TextStyle(color: Colors.black26),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (isEmail(_text.text) == false ||
                                _text.text.isEmpty) {
                              _validate = true;
                            } else {
                              _validate = false;
                              Navigator.pop(context);
                              _ShowActiveModalBottomSheet(context, size, _erorrEmail);
                            }
                          });
                        },
                        child: const Text("ادامه"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }











  Future<dynamic> _ShowActiveModalBottomSheet(
      BuildContext context, Size size, String _erorrEmail) {
    bool emailCheck = false;
    // final Function(String) _erorrEmail;
    String _erorrEmail = "";
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: ((context) {
          return Padding(
            // jahate inke input bere bala keyboard.
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        MyStrings.activateCode,
                        style: TextStyle(
                            fontFamily: "IranSans",
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          emailCheck = isEmail(value);
                        },
                        textAlign: TextAlign.center,
                        controller: _textActive,

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "کد فعالسازی...",
                          prefixIcon: Icon(CupertinoIcons.circle_grid_3x3),
                          errorText: _validate ? 'کد صحیح نمی باشد.' : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 2),
                          ),
                          hintStyle: TextStyle(color: Colors.black26),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyCatSelected(),));
                        },
                        child: const Text("ادامه"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }





}
