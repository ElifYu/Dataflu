import 'package:dataflu/sign-in-and-up/sign-in/signin.dart';
import 'package:dataflu/ui/colors.dart';
import 'package:dataflu/ui/login-register-button-ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dataflu App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
        );
      }
    );
  }
}


/*
Container(
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _isSelectedLeftButton = !_isSelectedLeftButton;
                              _isSelectedRightButton = !_isSelectedRightButton;
                            });
                          },
                          child: Wrap(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: _isSelectedRightButton
                                      ? Colors.blue
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
                              Text('I accept the user agreement', style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13
                              ),),
                            ],
                          ),
                        ),
                      ),
 */


