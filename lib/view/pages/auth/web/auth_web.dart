
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/view_model/cubit/auth/auth_cubit.dart';

import '../../../../view_model/cubit/states.dart';
import '../../../components/auth/auth_components.dart';
import '../../../components/auth/check_box.dart';
import '../../../components/styles/colors.dart';
import '../../home/web/home_web.dart';

class AuthWeb extends StatefulWidget {
  const AuthWeb({Key? key}) : super(key: key);

  @override
  State<AuthWeb> createState() => _AuthWebState();
}

class _AuthWebState extends State<AuthWeb> {


  int activeButton = 1;
  int generalButton = 0;
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return AuthCubit(); },
      child: BlocConsumer<AuthCubit, CubitStates>(
        listener: (BuildContext context, state) {
          if(state is LoginSuccessState || state is SignUpSuccessState /*|| state is GoogleAuthSucessState || state is FacebookAuthSucessState*/){
            navigateAndFinish(context, const HomeWeb());
          }
        },
        builder: (BuildContext context, Object? state) {
          AuthCubit myAuth = AuthCubit.get(context);
          return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Image.asset('assets/logo.png',
                              width: 80,
                              height: 100,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                generalButton = 0;
                              });
                            },
                            child: Text('Home', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (generalButton == 0 ? primary : Colors.black
                                )),),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                generalButton = 1;
                              });
                            },
                            child: Text('Shop', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (generalButton == 1 ? primary : Colors.black
                                )),),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                generalButton = 2;
                              });
                            },
                            child: Text('Blog', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (generalButton == 2 ? primary : Colors.black
                                )),),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                generalButton = 3;
                              });
                            },
                            child: Text('About', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (generalButton == 3 ? primary : Colors.black
                                )),),
                          ),
                          activeButton == 0 ? Container() : InkWell(
                            onTap: (){
                              setState(() {
                                generalButton = 4;
                              });
                            },
                            child: Text('Community', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (generalButton == 4 ? primary : Colors.black
                                )),),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  activeButton = 0;
                                  //signUp;
                                });
                                //SignInCubit.get(context).userSignIn(password: passwordController.text.toString(), email: emailController.text.toString());
                                //Navigator.push(context,  MaterialPageRoute(builder: (context) => const BottomBar()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  fixedSize: const Size(220, 40),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 80),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
//                            letterSpacing: 0.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Container(
                        width: MediaQuery.of(context).size.width*.8,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: .5,
                                )
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  activeButton = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: (activeButton == 0 ? primary : Colors.white),
                                        )
                                    )
                                ),
                                child: Text('Sign Up', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (activeButton == 0 ? primary : Colors.grey
                                    )),),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  activeButton = 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: (activeButton == 1 ? primary : Colors.white),
                                        )
                                    )
                                ),
                                child: Text('Login', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (activeButton == 1 ? primary : Colors.grey
                                    )),),
                              ),
                            ),
                          ],),
                      ),
                      const SizedBox(height: 40,),
                      activeButton == 0
                          ? Form(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.16, right: MediaQuery.of(context).size.width*.16),
                          child: Column(
                            children: [
                              Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: textFormField(
                                    labelName: 'First Name',
                                    controller: myAuth.firstNameController,
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  flex: 1,
                                  child: textFormField(
                                    labelName: 'Last Name',
                                    controller: myAuth.lastNameController,
                                    keyboardType: TextInputType.name,
                                  ),
                                )
                              ]),
                              const SizedBox(height: 30,),
                              textFormField(labelName: 'Email', controller: myAuth.emailController, keyboardType: TextInputType.emailAddress,),
                              const SizedBox(height: 30,),
                              textFormFieldPass(labelName: 'Password', controller: myAuth.passwordController, obscureText: true, validator: (input) {
                                if (input!.isEmpty || input.length < 5) {
                                  return "Password is weak";
                                }
                                return null;
                              }, ),
                              const SizedBox(height: 30,),
                              textFormFieldPass(labelName: 'Confirm Password', controller: myAuth.confirmPasswordController, obscureText: true, validator: (input) {
                                if (input != myAuth.passwordController.text) {
                                  return "Password not matched";
                                }
                                return null;
                              },),
                              const SizedBox(height: 25,),

                            ],
                          ),
                        ),
                      )
                          : Form(
                        key: formKey,
                        child:Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.16, right: MediaQuery.of(context).size.width*.16),
                          child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textFormField(labelName: 'Email', controller: myAuth.emailController, keyboardType: TextInputType.emailAddress,),
                              const SizedBox(height: 30),
                              textFormFieldPass(labelName: 'Password', controller: myAuth.passwordController, obscureText: true, validator: (input) {
                                if (input!.isEmpty || input.length < 8) {
                                  return "Password is weak";
                                }
                                return null;
                              }, ),

                            ],
                          ),
                        ),
                      ),
                      activeButton == 0
                          ? Container()
                          : webCheckBox((value){
                        setState(() {
                          global.value = value;
                        });
                      }, () { }, context),
                      const SizedBox(height: 25,),
                      InkWell(
                          onTap: () {
                            activeButton == 0
                                ? myAuth.signUp()
                                : myAuth.login();
                            },
                          child: btnAuth(text: activeButton == 0 ?  'Sign up' : 'Login', context: context)
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      webDontHaveAccouny(),
                      const SizedBox(height: 40,),
                      or(context, primary),
                      const SizedBox(height: 40,),
                      activeButton == 0
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: (){
                                //_login;
                              },
                              child: webGoogleFacebook(text: 'Continue with Google', imgName: 'assets/Google.png', color: primary)),
                          const SizedBox(width: 200,),
                          webGoogleFacebook(text: 'Continue with Facebook', imgName: 'assets/Facebook.png', color: primary),
                        ],)
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          webGoogleFacebook(text: 'Continue with Google', imgName: 'assets/Google.png', color: Colors.grey),
                          const SizedBox(width: 200,),
                          webGoogleFacebook(text: 'Continue with Facebook', imgName: 'assets/Facebook.png', color: Colors.grey),
                        ],),
                      const SizedBox(height: 80,),
                    ],
                  ),
                  Positioned(
                    top: 90,
                    left: 1,
                    child: Image.asset('assets/left.png',
                      width: 80,
                      height: 200,
                    ),),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Image.asset('assets/right.png',
                      width: 120,
                      height: 200,
                    ),)
                ]
            ),
          ),
        );
          },
      ),
    );
  }

}
