// ignore_for_file: prefer_const_constructors

import 'package:baby_tracker/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import '../../assets_path.dart';
import '../../constants/text_constants.dart';
import '../../textstyles.dart';
import '../../widgets/mybutton.dart';
import '../../widgets/text_field.dart';
import 'signup_controller.dart';


class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  ClipPath(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    clipper: CustomClipPath(),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.8),
                          Theme.of(context).primaryColor.withOpacity(0.3),
                        ],
                      )),
                      width: Get.width,
                      height: Get.height * 0.3-10,
                      child: Center(child: _addHeadingtext()),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //   decoration: BoxDecoration(
                            
                      //   color: Colors.blueGrey,
                            
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      //     shape: BoxShape.rectangle),
                            
                      margin: EdgeInsets.symmetric(horizontal: 15),
                            
                      child: SignInScreen(
actions: [



   AuthStateChangeAction<SignedIn>((context, signedIn) async {
                    // await Get.find<LoginControler>().addUserFirestore(signedIn);
                   
                    Get.to(()=>HomeView());
                  }),
],
                        
                                      subtitleBuilder: (context, action) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            action == AuthAction.signIn
                       ? 'Welcome to Baby Tracker app! Please sign in to continue.'
                       : 'Welcome to Baby Tracker app! Please create an account to continue',
                                          ),
                                        );
                                      },
                                      // footerBuilder: (context, _) {
                                      //   return const Padding(
                                      //     padding: EdgeInsets.only(top: 16),
                                      //     child: Text(
                                      //       'By signing in, you agree to our terms and conditions.',
                                      //       style: TextStyle(color: Colors.grey),
                                      //     ),
                                      //   );
                                      // },
                                      sideBuilder: (context, constraints) {
                                        return Text("kkkk");
                                      },
                                      headerBuilder: (context, constraints, _) {
                                        return Image.asset(logo);
                                      },
                                      providerConfigs: [
                                      EmailProviderConfiguration()
                                      ]
                                      ),
                    ),
                  ),

                  SizedBox(height: 50,)
                
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Container(
                  //     height: 100,
                  //     child: Align(
                  //       alignment: Alignment.bottomCenter,
                  //       child: RichText(
                  //         text: TextSpan(
                  //             text: accountExistsText,
                  //             style: Theme.of(context).textTheme.subtitle1,
                  //             children: [
                  //               TextSpan(
                        
                  //                 recognizer:  TapGestureRecognizer()
                  //                   ..onTap = () => Get.to(SigninView(),binding: BindingsBuilder.put(() => LoginController())),
                  //                   text: "Login",
                  //                   style: Theme.of(context).textTheme.subtitle1
                  //                       ?.copyWith(color: Colors.blue))
                  //             ]),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _addHeadingtext() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          signup.toUpperCase(),
          style: Theme.of(Get.context!).textTheme.subtitle1?.copyWith(fontSize: 30),
        ),
        Text(signuptitle.toUpperCase()),
      ],
    );
  }


}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.2, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
