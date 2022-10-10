import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/model/home/plant_model.dart';

import '../../../model/home/products_model.dart';
import '../../../model/home/seed_model.dart';
import '../../../model/home/tool_model.dart';
import '../../../view/pages/home/mobile/Qr_Code_Scanner.dart';
import '../../../view/pages/home/mobile/home/home_mobile.dart';
import '../../../view/pages/home/mobile/leaf/forums.dart';
import '../../../view/pages/home/mobile/notification.dart';
import '../../../view/pages/home/mobile/profile.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../states.dart';

class HomeCubit extends Cubit<CubitStates> {
  HomeCubit() : super(InitState());

  static HomeCubit get(context) => BlocProvider.of(context);



  TextEditingController searchController = TextEditingController();

  int currentIndex = 2;

  final screens = const [
    Forums(),
    QRViewExample(),
    HomeMobile(),
    NotificationScreen(),
    Profile()
  ];

  bool isLoading = true;


  ProductModel? productModel;

  Future<void> getProducts() async {
    emit(ProductsLoadingHomeState());
    await DioHelper.getData(url: productEndPoint, token: accessToken,).then((value) {
      print(accessToken);
      print('product');
      print(value.statusMessage);

      if(value.statusCode == 200){
        productModel = ProductModel.fromJson(value.data);
      /*  productData?.tool == null || productData?.seed == null || productData?.plant == null
            ? nullValue == productData!.tool || nullValue == productData?.seed || nullValue == productData?.plant
            : false;*/
        isLoading = false;
        emit(ProductsSuccessHomeState(productModel!));
        print(value.data);
        print(value.statusMessage);
      }
      emit(ProductsSuccessHomeState(productModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProductsErrorHomeState(error.response?.data['message'][0]));
      }
    });
  }


  PlantModel? plantModel;

  Future<void> getPlants() async {
    emit(GetPlantLoadingState());
    await DioHelper.getData(url: plantEndPoint, token: accessToken,).then((value) {
      print(accessToken);
      print('plant');
      print(value.statusMessage);

      if(value.statusCode == 200){
        plantModel = PlantModel.fromJson(value.data);
        /*  productData?.tool == null || productData?.seed == null || productData?.plant == null
            ? nullValue == productData!.tool || nullValue == productData?.seed || nullValue == productData?.plant
            : false;*/
        isLoading = false;
        emit(GetPlantSuccessState(plantModel!));
        print(value.data);
        print(value.statusMessage);
      }
      emit(GetPlantSuccessState(plantModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(GetPlantErrorState(error.response?.data['message'][0]));
      }
    });
  }


  SeedModel? seedModel;

  Future<void> getSeeds() async {
    emit(GetSeedLoadingState());
    await DioHelper.getData(url: seedEndPoint, token: accessToken,).then((value) {
      print(accessToken);
      print('seed');
      print(value.statusMessage);

      if(value.statusCode == 200){
        seedModel = SeedModel.fromJson(value.data);
        /*  productData?.tool == null || productData?.seed == null || productData?.plant == null
            ? nullValue == productData!.tool || nullValue == productData?.seed || nullValue == productData?.plant
            : false;*/
        isLoading = false;
        emit(GetSeedSuccessState(seedModel!));
        print(value.data);
        print(value.statusMessage);
      }
      emit(GetSeedSuccessState(seedModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(GetSeedErrorState(error.response?.data['message'][0]));
      }
    });
  }


  ToolModel? toolModel;

  Future<void> getTools() async {
    emit(GetToolLoadingState());
    await DioHelper.getData(url: toolEndPoint, token: accessToken,).then((value) {
      print(accessToken);
      print('tool');
      print(value.statusMessage);

      if(value.statusCode == 200){
        toolModel = ToolModel.fromJson(value.data);
        /*  productData?.tool == null || productData?.seed == null || productData?.plant == null
            ? nullValue == productData!.tool || nullValue == productData?.seed || nullValue == productData?.plant
            : false;*/
        isLoading = false;
        emit(GetToolSuccessState(toolModel!));
        print(value.data);
        print(value.statusMessage);
      }
      emit(GetToolSuccessState(toolModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(GetToolErrorState(error.response?.data['message'][0]));
      }
    });
  }
}