import 'package:flutter/material.dart';
import 'package:lavie_web/model/home/products_model.dart';
import 'package:lavie_web/view/pages/home/mobile/navigation_bottom_bar.dart';
import 'package:lavie_web/view/pages/home/web/home_web.dart';
import 'package:lavie_web/view_model/cubit/home/home_cubit.dart';
import 'package:lavie_web/view_model/database/local/shared_prefrences/string/access.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'view/pages/auth/mobile/auth_mobile.dart';
import 'view/pages/auth/web/auth_web.dart';
import 'view_model/database/local/SQLITE_DB/database.dart';
import 'view_model/database/local/shared_prefrences/preference_utils.dart';
import 'view_model/database/network/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
//  PreferenceUtils.getString(SharedKeys.apiToken);
  await PreferenceUtils.init();
  SQLHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

/*  ProductModel? productModel;
  ProductData? productData;*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
       // print(constraints.minWidth.toInt());
        /*print(productModel?.data);
        print('From Consumer : ${productData?.name}');*/

        print('hi');
        print(accessToken);

        //String os = Platform.operatingSystem;
        //print(getOS);

        if(constraints.minWidth.toInt() <= 560) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                //textScaleFactor: .5,
              ),
              child: SplashScreenView(
                navigateRoute: PreferenceUtils.getString(SharedKeys.apiToken).isEmpty
                ? const AuthMobile()
                : const NavigationBottomBar(),
                duration: 3000,
                imageSize: 70,
                imageSrc: 'assets/logo.png',
                backgroundColor: Colors.white,
              ));
        }

        print(accessToken);

        return PreferenceUtils.getString(SharedKeys.apiToken).isEmpty
            ? const AuthWeb()
            : const HomeWeb();
      }),
    );
  }
}


