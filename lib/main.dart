import 'package:flutter/material.dart';
import 'package:lavie_web/model/home/products_model.dart';
import 'package:lavie_web/view/pages/home/mobile/navigation_bottom_bar.dart';
import 'package:lavie_web/view/pages/home/web/home_web.dart';
import 'package:lavie_web/view_model/cubit/home/home_cubit.dart';
import 'package:lavie_web/view_model/database/local/shared_prefrences/string/access.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'view/components/styles/colors.dart';
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
            : const HomeWeb();
      }),
    );
  }
}



class MyHomePage extends StatelessWidget {

  var list = ["Home","Services", "Work", "About", 'shop'];
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
                  Row(
                    children: List.generate(4, (index){
                      return GestureDetector(
                        onTap: (){
                          _scrollToIndex(index);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
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
                      return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                index == 1 ? 'dddd' : list[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 50
                                ),
                              ),
                              index == 0 ? Column(
                                children: [
                                  const Text('Popular\n Categories'),
                                  SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('w'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('w'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('w'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('w'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('w'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('w'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text('Best seller'),
                                  SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image(image: AssetImage('assets/images/imgBox.png'))),
                                            Text('name'),
                                            Text('190 EGP'),
                                            SizedBox(height: 150,)
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            SizedBox(height: 150,),
                                            SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image(image: AssetImage('assets/images/imgBox.png'))),
                                            Text('name'),
                                            Text('190 EGP'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image(image: AssetImage('assets/images/imgBox.png'))),
                                            Text('name'),
                                            Text('190 EGP'),
                                            SizedBox(height: 150,)
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            SizedBox(height: 150,),
                                            SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image(image: AssetImage('assets/images/imgBox.png'))),
                                            Text('name'),
                                            Text('190 EGP'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image(image: AssetImage('assets/images/imgBox.png'))),
                                            Text('name'),
                                            Text('190 EGP'),
                                            SizedBox(height: 150,)
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            SizedBox(height: 150,),
                                            SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image(image: AssetImage('assets/images/imgBox.png'))),
                                            Text('name'),
                                            Text('190 EGP'),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              )
                                  : index == 1 ? Column(
                                children: [
                                  const Text('Blogs'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('name'),
                                            const Text('name'),
                                            const Text('190 EGP'),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('name'),
                                            const Text('name'),
                                            const Text('190 EGP'),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('name'),
                                            const Text('name'),
                                            const Text('190 EGP'),
                                          ],
                                        ),),
                                      Card(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('name'),
                                            const Text('name'),
                                            const Text('190 EGP'),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('name'),
                                            const Text('name'),
                                            const Text('190 EGP'),
                                          ],
                                        ),),
                                      Card(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                                            ),
                                            const Text('name'),
                                            const Text('name'),
                                            const Text('190 EGP'),
                                          ],
                                        ),),
                                    ],
                                  ),
                                ],
                              )
                                  : index == 2 ? Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text('About us'),
                                        SizedBox(
                                            width: 400,
                                            child: Text("Welcome to La Vie, your number one source for planting. We're dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness. Founded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ",
                                              maxLines: 8,)
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        const SizedBox(
                                          width: 350,
                                          height: 350,
                                        ),
                                        Positioned(
                                          top: 30,
                                          left: 20,
                                          child: Container(
                                            width: 300,
                                            height: 300,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 3,
                                                    color: primary
                                                )
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Container(
                                            width: 300,
                                            height: 300,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: const DecorationImage(image: AssetImage('assets/images/success.png'),
                                                  fit: BoxFit.cover),),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                                  : index == 3 ? SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                        Image.asset('assets/images/mobileApp.png', width: 600, height: 600,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('About us'),
                                            const SizedBox(
                                              width: 400,
                                              child: Text("Welcome to La Vie, your number one source for planting. We're dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness. Founded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ",
                                                maxLines: 8,),
                                            ),
                                            const Text('Install by'),
                                            Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: (){
                                                      // navigateTo(context, SignUp());
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.asset('assets/images/play.png',width: 12, height: 20,),
                                                        const Text('Play Store', style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight: FontWeight.bold,
                                                        ),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20,),
                                                Container(
                                                  width: 200,
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: (){
                                                      // navigateTo(context, SignUp());
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.asset('assets/images/app.png',width: 12, height: 20,),
                                                        const Text('App Store', style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight: FontWeight.bold,
                                                        ),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        ],
                                ),
                                        Container(
                                          color: darkGreyColor,
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height/4,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.topRight,
                                                    child: Image.asset('assets/logo.png',
                                                      width: 80,
                                                      height: 100,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: const [
                                                      Text('LA VIE '),
                                                      Text("We're dedicated to giving you the"),
                                                    ],
                                                  ),
                                                  const Text("very best of plants, with a focus on dependability",
                                                    maxLines: 2,),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text('SECTIONS'),
                                                  Text('Home'),
                                                  Text('Category'),
                                                  Text('New'),
                                                  Text('Request To Be Seller'),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text('SECTIONS'),
                                                  Text('Home'),
                                                  Text('Category'),
                                                  Text('New'),
                                                  Text('Request To Be Seller'),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text('SECTIONS'),
                                                  Text('Home'),
                                                  Text('Category'),
                                                  Text('New'),
                                                  Text('Request To Be Seller'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  : Text('data')
                            ],
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
    controller.animateToPage(index + 1, duration: const Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
