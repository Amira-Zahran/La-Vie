import 'package:dio/dio.dart';
import 'package:lavie_web/model/forums/forums_model.dart';
import 'package:lavie_web/model/forums/my_forums_model.dart';
import 'package:lavie_web/model/forums/profile_model.dart';
import 'package:lavie_web/model/home/plant_model.dart';
import 'package:lavie_web/model/home/products_model.dart';
import 'package:lavie_web/model/home/seed_model.dart';
import '../../model/auth/login_model.dart';
import '../../model/auth/signup_model.dart';
import '../../model/forums/post_model.dart';
import '../../model/home/tool_model.dart';

abstract class CubitStates{}

class InitState extends CubitStates{}

class LoginSuccess extends CubitStates{}


class LoginLoadingState extends CubitStates{}


class LoginSuccessState extends CubitStates{
  final LoginModel loginModel ;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends CubitStates{
  final Response? error;
  LoginErrorState(this.error);
}

class RegisterLoadingState extends CubitStates{}

class SignUpSuccessState extends CubitStates{
  final SignUpModel signUpModel ;

  SignUpSuccessState(this.signUpModel);
}

class SignUpErrorState extends CubitStates{
  final Response? error;
  SignUpErrorState(this.error);
}


class ForumsLoadingState extends CubitStates{}

class ForumsSuccessState extends CubitStates{
  final ForumModel forumsModel ;

  ForumsSuccessState(this.forumsModel);
}

class ForumsErrorState extends CubitStates{
  final Response? error;
  ForumsErrorState(this.error);
}



class AddForumLoadingState extends CubitStates{}


class AddForumSuccessState extends CubitStates{
  final PostModel postModel ;

  AddForumSuccessState(this.postModel);
}

class AddForumErrorState extends CubitStates{
  final Response? error;
  AddForumErrorState(this.error);

}


class MyForumLoadingState extends CubitStates{}

class MyForumSuccessState extends CubitStates{
  final MyForumModel myForumModel ;

  MyForumSuccessState(this.myForumModel);
}

class MyForumErrorState extends CubitStates{
  final Response? error;
  MyForumErrorState(this.error);
}





class ProfileLoadingState extends CubitStates{}

class ProfileSuccessState extends CubitStates{
  final ProfileModel profileModel ;

  ProfileSuccessState(this.profileModel);
}

class ProfileErrorState extends CubitStates{
  final Response? error;
  ProfileErrorState(this.error);
}



class ForumImageSuccessState extends CubitStates{}

class ForumImageErrorState extends CubitStates{}


class ProductsLoadingHomeState extends CubitStates{}

class ProductsSuccessHomeState extends CubitStates{
  final ProductModel productModel ;
  ProductsSuccessHomeState(this.productModel);
}

class ProductsErrorHomeState extends CubitStates{
  final Response? error;
  ProductsErrorHomeState(this.error);
}

class GetPlantLoadingState extends CubitStates{}

class GetPlantSuccessState extends CubitStates{
  final PlantModel plantModel ;
  GetPlantSuccessState(this.plantModel);
}

class GetPlantErrorState extends CubitStates{
  final Response? error;
  GetPlantErrorState(this.error);
}



class GetSeedLoadingState extends CubitStates{}

class GetSeedSuccessState extends CubitStates{
  final SeedModel seedModel ;
  GetSeedSuccessState(this.seedModel);
}

class GetSeedErrorState extends CubitStates{
  final Response? error;
  GetSeedErrorState(this.error);
}



class GetToolLoadingState extends CubitStates{}

class GetToolSuccessState extends CubitStates{
  final ToolModel toolModel ;
  GetToolSuccessState(this.toolModel);
}

class GetToolErrorState extends CubitStates{
  final Response? error;
  GetToolErrorState(this.error);
}

