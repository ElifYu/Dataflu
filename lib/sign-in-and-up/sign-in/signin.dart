import 'package:dataflu/ui/login-register-button-ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../ui/colors.dart';
import '../sign-up/signup.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  final TextEditingController textController = TextEditingController();
  late AnimationController controller;

  var _opacityEmail = 0.0;
  var _opacityPass= 0.0;


  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  var emailControl = '0';
  var passControl = '0';

   validateEmail(String? value) async{
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)){
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        emailControl = '1';
        _opacityEmail = 0;
        controller.forward(from: 0.0);
      });
    await Future.delayed(Duration(milliseconds: 400)).then((value) {
      setState(() {
        _opacityEmail = 1;
      });
    });
  }
    else {
      // ignore: curly_braces_in_flow_control_structures
      emailControl = '0';
      if(controllerPass.text.isEmpty || controllerPass.text.length <=5) {
        setState(() {
          passControl = "1";
          _opacityPass = 0;
          controller.forward(from: 0.0);
          print('Boi');
        });
        await Future.delayed(Duration(milliseconds: 400)).then((value) {
          setState(() {
            _opacityPass = 1;
          });
        });
      }
      else{
        setState(() {
          passControl = "0";
        });
      }
    }
  }


  onPressed() async{
    if(controllerEmail.text.isEmpty) {
      setState(() {
        emailControl = "1";
        _opacityEmail = 0;
        controller.forward(from: 0.0);
      });
      await Future.delayed(Duration(milliseconds: 400)).then((value) {
        setState(() {
          _opacityEmail = 1;
        });
      });
    }
    else{
      validateEmail(controllerEmail.text);
    }


  }



  late bool _passwordVisible;
  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation =
    Tween(begin: 0.0, end: 24.0).chain(CurveTween(curve: Curves.elasticIn)).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(  //
            child: SvgPicture.asset('images/Signin-background.svg', fit: BoxFit.fill,),
          ),
          AnimatedBuilder(
            animation: offsetAnimation,
            builder: (buildContext, child) {
              if (offsetAnimation.value < 0.0) print('${offsetAnimation.value + 8.0}');
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: SvgPicture.asset('images/dataflu.svg', height: 35,),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 40.w,
                        margin: EdgeInsets.symmetric(horizontal: 24.0),
                        padding: EdgeInsets.only(left: offsetAnimation.value + 24.0, right: 24.0 - offsetAnimation.value),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.h, right: 5.h, top: 8.h, bottom: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sign in to your account', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 24
                                ),),
                                SizedBox(height: 15),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: "Don't have an account?", style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.blueGrey.shade800,
                                        )),
                                        TextSpan(
                                          text: ' Sign up',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: appColorLight
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Text('Email', style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 13
                                ),),
                                SizedBox(height: 14),
                                TextField(
                                  cursorWidth: 3,
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: controllerEmail,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: BorderSide(color: Colors.grey.shade400, width: 0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                                    ),
                                  ),
                                ),
                                emailControl == '1' ?
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: AnimatedOpacity(
                                    opacity:  _opacityEmail,
                                    duration: const Duration(milliseconds: 500),
                                    // The green box must be a child of the AnimatedOpacity widget.
                                    child: Wrap(
                                      children: [
                                        Icon(Icons.warning_rounded, color: Color(0xFFd53c37), size: 18,),
                                        SizedBox(width: 7),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Text('Please enter your email', style: TextStyle(
                                              color: Color(0xFFd53c37)
                                          ),),
                                        )
                                      ],
                                    ),
                                  )
                                ) : Text(''),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text('Password', style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 13
                                    ),),
                                  ],
                                ),

                                SizedBox(height: 14),
                                TextField(
                                  controller: controllerPass,
                                  cursorWidth: 3,
                                  obscureText: !_passwordVisible,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: BorderSide(color: Colors.grey.shade400, width: 0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                                    ),
                                    suffixIcon: Tooltip(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[800],
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      message: _passwordVisible ? 'Hide password' : 'Show password',
                                      child: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.blueGrey[800],
                                          size: 22,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                passControl == '1' ?
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: AnimatedOpacity(
                                      opacity:  _opacityPass,
                                      duration: const Duration(milliseconds: 500),
                                      // The green box must be a child of the AnimatedOpacity widget.
                                      child: Wrap(
                                        children: [
                                          Icon(Icons.warning_rounded, color: Color(0xFFd53c37), size: 18,),
                                          SizedBox(width: 7),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2),
                                            child: Text('Incorrect email or password.', style: TextStyle(
                                                color: Color(0xFFd53c37)
                                            ),),
                                          )
                                        ],
                                      ),
                                    )
                                ) : Text(''),
                                SizedBox(height: 20),

                                Text('Forgot your password?', style: TextStyle(
                                    color: appColorLight,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600
                                ),),
                                SizedBox(height: 25),
                                button(context, onPressed),//controller.forward(from: 0.0);
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 26),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.copyright, size: 17, color: Colors.blueGrey[600],),
                            SizedBox(width: 5),
                            Text('Dataflu', style: TextStyle(
                              color: Colors.blueGrey[600],
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),),
                            SizedBox(width: 10),
                            Icon(Icons.circle, size: 4, color: Colors.grey[600],),
                            SizedBox(width: 10),
                            Text('Contact', style: TextStyle(
                                color: Colors.blueGrey[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),),
                            SizedBox(width: 10),
                            Icon(Icons.circle, size: 4, color: Colors.grey[600],),
                            SizedBox(width: 10),
                            Text('Privacy & terms', style: TextStyle(
                                color: Colors.blueGrey[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}







