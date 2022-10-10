import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:lavie_web/view_model/cubit/states.dart';

import '../../../../view_model/cubit/auth/auth_cubit.dart';
import '../../../components/auth/auth_components.dart';
import '../../../components/styles/colors.dart';
import '../../home/mobile/navigation_bottom_bar.dart';

class AuthMobile extends StatefulWidget {
  const AuthMobile({Key? key}) : super(key: key);

  @override
  State<AuthMobile> createState() => _AuthMobileState();
}

class _AuthMobileState extends State<AuthMobile> {

  int activeButton = 1;
  bool isPassword = true;

  Map<String, dynamic>? _userData;
  bool _checking = true;
  AccessToken? _accessToken;

  /*@override
  void initState(){
    super.initState();

    _checkIfisLoggedIn();
  }
*/
 /* _checkIfisLoggedIn()async{
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

  if(accessToken != null){
    print(accessToken.toJson());
    final userData = await FacebookAuth.instance.getUserData();
    _accessToken = accessToken;
    setState(() {
      _userData = userData;
    });
    }else{
    _login();
  }
  }
*/
  _login()async{
    final LoginResult result = await FacebookAuth.instance.login();

    if(result.status == LoginStatus.success){
      _accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
    _userData = userData;
    }else{
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout()async{
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {return AuthCubit(); },
      child: BlocConsumer<AuthCubit, CubitStates>(
        listener: (BuildContext context, state) {
          if(state is LoginSuccessState || state is SignUpSuccessState/* || state is GoogleAuthSucessState || state is FacebookAuthSucessState*/){
            navigateAndFinish(context, const NavigationBottomBar());
          }
        },
        builder: (BuildContext context, Object? state) {
          AuthCubit myAuth = AuthCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/leaf_top.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Image.asset('assets/la_via.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 20,),
                    Row(
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
                                        width: 2
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
                                        width: 2
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
                    const SizedBox(height: 20,),
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
                    const SizedBox(height: 25,),
                    GestureDetector(
                        onTap: () {
                          activeButton == 0
                              ? myAuth.signUp()
                              : myAuth.login();
                          },
                        child: btnAuth(text: activeButton == 1 ? 'Login' : 'Sign up', context: context)
                    ),
                    const SizedBox(height: 25,),
                    or(context, Colors.grey),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: (){
                              //GoogleAuthCubit.get(context).googleAuth(picture: '', email: '', firstName: '', id: '', lastName: '', );
                            },
                            child: mobileGoogleFacebook('assets/Google.png')),
                        const SizedBox(width: 20,),
                        InkWell(
                            onTap: (){
                              _login();
                              //FacebookAuthCubit.get(context).facebookAuth(photo: '', email: '', lastName: '', firstName: '', id: '',);
                            },
                            child: mobileGoogleFacebook('assets/Facebook.png')),
                      ],),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset('assets/leaf_bottom.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              )
        ),
          );
          },
      ),
    );
  }
}
