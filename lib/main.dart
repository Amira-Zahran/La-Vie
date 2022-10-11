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
                navigateRoute: /*PreferenceUtils.getString(SharedKeys.apiToken).isEmpty
                ? */const AuthMobile(),
                //: const NavigationBottomBar(),
                duration: 3000,
                imageSize: 70,
                imageSrc: 'assets/logo.png',
                backgroundColor: Colors.white,
              ));
        }

        print(accessToken);

        return PreferenceUtils.getString(SharedKeys.apiToken).isEmpty
            ? const AuthWeb()
            : HomeWeb();
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {

  var list = ["Home","Services", "Work", "About"];
  var colors = [Colors.orange, Colors.blue, Colors.red, Colors.green];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: List.generate(3, (index){
                      return GestureDetector(
                        onTap: (){
                          _scrollToIndex(index);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                              list[index+1]
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
              Expanded(
                child : PageView(
                    scrollDirection: Axis.vertical,
                    pageSnapping: false,
                    controller: controller,
                    children: List.generate(list.length, (index){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: double.maxFinite,
                        color: colors[index],
                        child: Center(
                          child: Text(
                            list[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50
                            ),
                          ),
                        ),
                      );
                    })
                ),
              ),
            ],
          )
      ),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index + 1, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}

