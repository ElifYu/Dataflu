import 'package:country_code_picker/country_code_picker.dart';
import 'package:dataflu/ui/login-register-button-ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../ui/colors.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin{

  final TextEditingController textController = TextEditingController();
  late AnimationController controller;

  var _opacityEmail = 0.0;
  var _opacityPass = 0.0;
  var _opacityFullName = 0.0;

  var emailControl = '0';
  var fullNameControl = '0';
  var passControl = '0';

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerPass = TextEditingController();


  bool _isSelectedRightButton = false;
  bool _isSelectedLeftButton = false;

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
      setState(() {
        emailControl = '0';
      });
      if(controllerFullName.text.isEmpty){
        setState(() {
          fullNameControl = "1";
          _opacityFullName = 0;
          controller.forward(from: 0.0);
          print('Boiüüü');
        });
        await Future.delayed(Duration(milliseconds: 400)).then((value) {
          setState(() {
            _opacityFullName = 1;
          });
        });
      }
      else{
        setState(() {
          fullNameControl = "0";
        });
        if(controllerPass.text.isEmpty || controllerPass.text.length <= 5) {
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
    ////////////////////// Pass ///////////////////////////
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
            child: SvgPicture.asset('images/Signup-background.svg', fit: BoxFit.fill,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 40, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: SvgPicture.asset('images/dataflu.svg', height: 30,),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 30.w,
                          child: ListTile(
                            horizontalTitleGap: 0.0,
                            minVerticalPadding: 9,
                            leading: Icon(Icons.check_circle_rounded, color: Colors.indigoAccent,),
                            title: Text('Get started quickly'),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text('Integrate with developer-friendly APIs or choose low-code or pre-built solutions.'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 30.w,
                          child: ListTile(
                            horizontalTitleGap: 0.0,
                            minVerticalPadding: 9,
                            leading: Icon(Icons.check_circle_rounded, color: Colors.indigoAccent,),
                            title: Text('Support any business model'),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text('E-commerce, subscriptions, SaaS platforms, marketplaces, and more—all within a unified platform.'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        Container(
                          width: 30.w,
                          child: ListTile(
                            horizontalTitleGap: 0.0,
                            minVerticalPadding: 9,
                            leading: Icon(Icons.check_circle_rounded, color: Colors.indigoAccent,),
                            title: Text('Join millions of businesses'),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text('Dataflu is trusted by ambitious startups and enterprises of every size.'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 26),
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.circle, size: 9, color: Colors.blueGrey[600],),
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
                  )
              ),
              Align(
                alignment: Alignment.topRight,
                child: AnimatedBuilder(
                    animation: offsetAnimation,
                    builder: (buildContext, child) {
                    if (offsetAnimation.value < 0.0) print('${offsetAnimation.value + 8.0}');
                    return Container(
                      width: 40.w,
                      child: Card(
                        margin: EdgeInsets.only(left: offsetAnimation.value + 20.0, right: 40.0 - offsetAnimation.value, top: 40),
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 50, right: 50, top: 60, bottom: 35),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: Row(
                                    children: [
                                      Text('Create your Dataflu account', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 24
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: Row(
                                    children: [
                                      Text('Email', style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 13
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 14),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: TextFormField(
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
                                ) :
                                emailControl == '2' ?
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: AnimatedOpacity(
                                      opacity:  _opacityEmail,
                                      duration: const Duration(milliseconds: 500),
                                      // The green box must be a child of the AnimatedOpacity widget.
                                      child: Wrap(
                                        children: [
                                          Icon(Icons.check_circle, color: Color(0xFF7FFF00), size: 18,),
                                          SizedBox(width: 7),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2),
                                            child: Text('Nice. This is an acceptable email address.', style: TextStyle(
                                                color: Color(0xFFd53c37)
                                            ),),
                                          )
                                        ],
                                      ),
                                    )
                                ) :
                                Text(''),
                                ////////////////// Full Name /////////////////////////
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: Row(
                                    children: [
                                      Text('Full Name', style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 13
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 14),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: TextFormField(
                                    cursorWidth: 3,
                                    maxLines: 1,
                                    controller: controllerFullName,
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
                                ),

                                fullNameControl == '1' ?
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: AnimatedOpacity(
                                      opacity:  _opacityFullName,
                                      duration: const Duration(milliseconds: 500),
                                      // The green box must be a child of the AnimatedOpacity widget.
                                      child: Wrap(
                                        children: [
                                          Icon(Icons.warning_rounded, color: Color(0xFFd53c37), size: 18,),
                                          SizedBox(width: 7),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2),
                                            child: Text('Please enter your full name', style: TextStyle(
                                                color: Color(0xFFd53c37)
                                            ),),
                                          )
                                        ],
                                      ),
                                    )
                                ) : Text(''),


                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: Row(
                                    children: [
                                      Text('Country', style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 13
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 14),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    border: Border.all(color: Colors.grey.shade400, width: 0.0),
                                  ),
                                  child: Row(
                                    children: [
                                      CountryCodePicker(
                                        showDropDownButton: true,
                                        onChanged: print,
                                        initialSelection: 'TR',
                                        favorite: ['+90','TR'],
                                        showCountryOnly: true,
                                        showOnlyCountryWhenClosed: true,
                                        alignLeft: false,
                                        searchDecoration: InputDecoration(
                                          border: InputBorder.none,
                                          filled: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(''),
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
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: TextField(
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
                                            child: Text('Password must be more than 6 characters', style: TextStyle(
                                                color: Color(0xFFd53c37)
                                            ),),
                                          )
                                        ],
                                      ),
                                    )
                                ) : Text(''),
                                SizedBox(height: 20),

                                Container(
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _isSelectedLeftButton = !_isSelectedLeftButton;
                                        _isSelectedRightButton = !_isSelectedRightButton;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: _isSelectedRightButton
                                                  ? Colors.indigo
                                                  : Colors.grey.withOpacity(0.50),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Icon(Icons.check, color: Colors.white, size: _isSelectedRightButton ? 15.0 : 14.0,),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _isSelectedLeftButton = !_isSelectedLeftButton;
                                                _isSelectedRightButton = !_isSelectedRightButton;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 8,),
                                        Expanded(
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(text: 'Get emails from Stripe about product updates, industry news, and events. If you change your mind, you can unsubscribe at any time.'
                                                    , style: TextStyle(
                                                        color: Colors.grey,
                                                        height: 1.3,
                                                        fontSize: 13
                                                    )),
                                                TextSpan(
                                                  text: '\nPrivacy Policy',
                                                  style: TextStyle(color: Colors.indigoAccent, fontSize: 13, fontWeight: FontWeight.w500, height: 1.4),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                _isSelectedRightButton == true ?
                                button(context, onPressed) : buttonSolid(context, (){}),
                                // controller.forward(from: 0.0);
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
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
                                          text: ' Sign in',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.indigoAccent
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

