import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/forums/forums_model.dart';
import '../../../model/forums/my_forums_model.dart';
import '../../../model/forums/post_model.dart';
import '../../../model/forums/profile_model.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../states.dart';

class ForumsCubit extends Cubit<CubitStates> {
  ForumsCubit() : super(InitState());

  static ForumsCubit get(context) => BlocProvider.of(context);

  bool isLoading = true;


  ForumModel? forumModel;

  Future<void> getForums() async {
    emit(ForumsLoadingState());
    await DioHelper.getData(url: forumsEndPoint, token: accessToken,).then((value) {
      print(accessToken);
      print('forums');
      print(value.statusMessage);
      if(value.statusCode == 200){
        forumModel = ForumModel.fromJson(value.data);
        isLoading = false;
        emit(ForumsSuccessState(forumModel!));
        print(value.data);
        print(value.statusMessage);
      }
      emit(ForumsSuccessState(forumModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.response!.data['message'],);
        emit(ForumsErrorState(error.response!.data['message'][0]));
      }
    });
  }


  MyForumModel? myForumModel;

  Future<void> getMyForums() async {
    emit(MyForumLoadingState());
    await DioHelper.getData(url: myForumsEndPoint, token: accessToken,).then((value) {
      print(accessToken);
      print('Myforums');
      print(value.statusMessage);
      if(value.statusCode == 200){
        myForumModel = MyForumModel.fromJson(value.data);
        isLoading = false;
        emit(MyForumSuccessState(myForumModel!));
        print(value.data);
        print(value.statusMessage);
      }
      emit(MyForumSuccessState(myForumModel!));
    }).catchError((error){
      print(error);
      if(error is DioError){
        print(error.response!.data['message'],);
        emit(MyForumErrorState(error.response!.data['message'][0]));
      }
    });
  }


  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  PostModel? postModel;
  Future<void> createPost({
    required String? title,
    required String? description,
    String? postImage,
  }) async {
    emit(AddForumLoadingState());
    await DioHelper.postData(
      data: {
        'title':title,
        'description':description,
        'imageBase64':postImage,
      },
      url: forumsEndPoint,
      token: accessToken,
    ).then((value) {
      postModel = PostModel.fromJson(value.data);
      print(postModel!.data.title);
      emit(AddForumSuccessState(postModel!));
    }).catchError((error){
      print(error.toString());
      if(error is DioError) {
        print(error.message.toString());
        emit(AddForumErrorState(error.response!.data['message'][0]));
      }
    });

  }



  ProfileModel? profileModel;

  Future<void> getUserData() async {
    emit(ProfileLoadingState());
    await DioHelper.getData(
      url: myProfileEndPoint,
      token: accessToken,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);

      emit(ProfileSuccessState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProfileErrorState(error.response!.data['message'][0]));
      }
    });
  }


  String? postImage;
  final ImagePicker _picker = ImagePicker();


  Future getImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      postImage = base64Encode(File(image.path).readAsBytesSync());
      print(postImage);
      emit(ForumImageSuccessState());
    } else {
      print('Image not selected');
      emit(ForumImageErrorState());
    }
  }



}