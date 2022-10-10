import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/model/auth/login_model.dart';

import '../../../model/auth/signup_model.dart';
import '../../database/local/shared_prefrences/preference_utils.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../states.dart';

class AuthCubit extends Cubit<CubitStates>{
  AuthCubit() : super(InitState());

  static AuthCubit get(context) => BlocProvider.of(context);



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();


  LoginModel? loginModel;

  Future<void> login () async{
    var json = {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString()
    };
    await DioHelper.postData(url: loginEndPoint, data: json).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      //accessToken = loginModel!.data!.accessToken.toString();
      accessToken = value.data['data']['accessToken'];
      PreferenceUtils.setString(SharedKeys.apiToken, accessToken);
      print(accessToken);
      print('------------token');
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      print(error);
      if(error is DioError){
        print(error.response!.data['message'],);
        emit(LoginErrorState(error.response!.data['message'][0]));
      }
    });
  }


  SignUpModel? signUpModel;

  Future<void> signUp () async{
    var json = {
      "firstName": firstNameController.text.toString(),
      "lastName": lastNameController.text.toString(),
      "email": emailController.text.toString(),
      "password": passwordController.text.toString(),
    };
    await DioHelper.postData(url: signupEndPoint, data: json).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      accessToken = value.data['data']['accessToken'];
      PreferenceUtils.setString(SharedKeys.apiToken, accessToken);
      print(accessToken);
      print('------------token');
      print(value.data);
      emit(SignUpSuccessState(signUpModel!));
    }).catchError((error){
      print(error);
      if(error is DioError){
        print(error.response!.data['message'],);
        emit(SignUpErrorState(error.response!.data['message'][0]));
      }
    });
  }

/*
  LoginModel? loginModel;


  login() async {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
    },).then((value)  {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      if(error is DioError){

        print(error.response!.data['message'],);
        emit(LoginErrorState(error.response!.data['message'][0]));
      }
    });
  }




  SignUpModel? signUpModel;

  signUp() async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: signupEndPoint, data: {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
      'firstName': firstNameController.text.toString(),
      'lastName': lastNameController.text.toString(),
    },).then((value)  {
      signUpModel = SignUpModel.fromJson(value!.data);

      emit(SignUpSuccessState(signUpModel!));
    }).catchError((error){
      if(error is DioError){

        print(error.response!.data['message'],);
        emit(SignUpErrorState(error.response!.data['message'][0]));
      }
    });
  }*/
}