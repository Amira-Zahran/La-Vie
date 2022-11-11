import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lavie_web/view/components/home_mobile/home_component.dart';
import 'package:lavie_web/view/components/styles/colors.dart';
import 'package:lavie_web/view_model/cubit/home/home_cubit.dart';
import 'package:lavie_web/view_model/cubit/states.dart';
import 'package:intl/intl.dart';

import '../../../../../model/home/cart_model.dart';
import '../../../../../model/home/plant_model.dart';
import '../../../../../model/home/products_model.dart';
import '../../../../../model/home/seed_model.dart';
import '../../../../../model/home/tool_model.dart';
import '../../../../../view_model/database/local/SQLITE_DB/database.dart';
import '../../../../components/auth/auth_components.dart';
import 'cart.dart';
import 'quiz/quiz_questions.dart';
import 'search.dart';

class HomeMobile extends StatefulWidget {
  HomeMobile({Key? key}) : super(key: key);


  @override
  State<HomeMobile> createState() => _HomeMobileState();

}

class _HomeMobileState extends State<HomeMobile> {

  int activeButton = 0;


  final _scrollbar = ScrollController();

  //String dateFormat = DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now());
  String day = DateFormat('EEEE').format(DateTime.now()); //get day name from date using intl (package)

  int quantity = 1;




fetch(){
  HomeCubit.get(context).getProducts();
  HomeCubit.get(context).getPlants();
  HomeCubit.get(context).getSeeds();
  HomeCubit.get(context).getTools();
}

@override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, CubitStates>(
      listener: (BuildContext context, state) { },
      builder: (context, state) {
        HomeCubit myHome = HomeCubit.get(context);

        return  SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              GestureDetector(
                onTap: (){
                  navigateAndFinish(context, const QuizQuestions());
                  setState(() {
                    activeButton = 10;
                  });
                },
                child: Visibility( // show or hide widget
                visible: activeButton == 10 ? (day == 'Tuesday') ? true : false :  false,
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: MediaQuery.of(context).size.width *.8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: primary,borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                      Icons.question_mark,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Image.asset('assets/logo.png', width: 130, height: 30,),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300, height: 45,
                    decoration: BoxDecoration(color: lightGrey,borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        //controller: myHome.searchController,
                        onChanged: (v){
                          setState(() {
                            navigateTo(context, const Search());
                          });},
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search,color: darkGreyColor),
                          hintStyle: TextStyle(color: lightBlack,
                            fontFamily: "Cairo_Regular",
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Search',
                        ),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                ),
              ),
                  GestureDetector(
                    onTap: (){
                      navigateTo(context, const Cart());
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(Icons.shopping_cart_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              SingleChildScrollView(
                controller: _scrollbar,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  SizedBox(
                    width: 90,
                    height: 35,
                    child: customBtn(forColor: (activeButton == 0 ? lightBlack : primary), backColor: (activeButton == 0 ? Colors.white : lightGrey), color: (activeButton == 0 ? primary : lightGrey), onPressed: ((){setState(() {activeButton = 0;});
                    }), text: 'All', textColor: (activeButton == 0 ? primary : darkGreyColor),),
                  ),

                  SizedBox(
                    width: 90,
                    height: 35,
                    child: customBtn(forColor: (activeButton == 1 ? lightBlack : primary), backColor: (activeButton == 1 ? Colors.white : lightGrey), color: (activeButton == 1 ? primary : lightGrey), onPressed: ((){
                      setState(() {activeButton = 1;});}), text: 'Plants', textColor: (activeButton == 1 ? primary : darkGreyColor)),
                  ),

                  SizedBox(
                    width: 90,
                    height: 35,
                    child: customBtn(forColor: (activeButton == 2 ? lightBlack : primary), backColor: (activeButton == 2 ? Colors.white : lightGrey), color: (activeButton == 2 ? primary : lightGrey), onPressed: ((){setState(() {activeButton = 2;});
                    }), text: 'Seeds', textColor: (activeButton == 2 ? primary : darkGreyColor),),
                  ),

                  SizedBox(
                    width: 90,
                    height: 35,
                    child: customBtn(forColor: (activeButton == 3 ? lightBlack : primary), backColor: (activeButton == 3 ? Colors.white : lightGrey), color: (activeButton == 3 ? primary : lightGrey), onPressed: ((){
                      setState(() {activeButton = 3;});}), text: 'Tools', textColor: (activeButton == 3 ? primary : darkGreyColor),),
                  ),
                ],
                ),
              ),
              const SizedBox(height: 30,),

              Expanded(
                  child: activeButton == 0
                      ? buildGridProduct(myHome.productModel)
                      : activeButton == 1
                           ? buildGridPlant(myHome.plantModel)
                           : activeButton == 2
                                ? buildGridSeed(myHome.seedModel)
                                : buildGridTool(myHome.toolModel)
              )
            ],
          ),
        ));
      });
  }

  Widget buildGridProduct(ProductModel? productModel){
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 150
    ), itemBuilder: (context , index) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            width: 800,
            height: 800.0,
            child: Container(),
          ),
          const Positioned(
              top: 20,
              left: 20,
              right: 20,
              bottom: 6,
              child: Card(elevation: 10,)),
          Positioned(
            top: 25,
            left: 20,
            right: 20,
            bottom: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    if (quantity != 1) {
                      quantity = quantity - 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.remove,
                      size: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Text(quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    if (quantity >= 1) {
                      quantity = quantity + 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.add,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            top: 80,
            left: 10,
            child: SizedBox(
              height: 85,
              width: 202,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white,),
                    children: [
                      TextSpan(
                        text: '${productModel!.data![index].name}\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                      TextSpan(
                        text: '${productModel.data![index].price!} EGP',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 8,
            left: 30,
            right: 30,
            child: SizedBox(
              //width: 50,
              height: 30,
              child: ElevatedButton(
                    onPressed: (){
                      SQLHelper.addPlant(productModel!.data![index].name!, productModel.data![index].price!, quantity, 'https://lavie.orangedigitalcenteregypt.com${productModel.data![index].imageUrl!}');
                      Fluttertoast.showToast(msg: 'Plant Added');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Cart()));
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10.0))),
                    child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
            ),
          ),

          productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            right: 70,
            bottom: 70,
            width: 100,
            height: 80,
            child: Image.network('https://lavie.orangedigitalcenteregypt.com${productModel?.data![index].imageUrl!}',
            ),)

        ]), itemCount: productModel?.data?.length,);
  }

  Widget buildGridPlant(PlantModel? plantModel){
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 150
    ), itemBuilder: (context , index) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            width: 800,
            height: 800.0,
            child: Container(),
          ),
          const Positioned(
              top: 20,
              left: 20,
              right: 20,
              bottom: 6,
              child: Card(elevation: 10,)),
          Positioned(
            top: 25,
            left: 20,
            right: 20,
            bottom: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    if (quantity != 1) {
                      quantity = quantity - 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.remove,
                      size: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Text(quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    if (quantity >= 1) {
                      quantity = quantity + 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.add,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          plantModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            top: 80,
            left: 10,
            child: SizedBox(
              height: 85,
              width: 202,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white,),
                    children: [
                      TextSpan(
                        text: '${plantModel!.data![index].name}\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                      TextSpan(
                        text: '${plantModel.data![index].sunLight!} EGP',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 8,
            left: 30,
            right: 30,
            child: SizedBox(
              //width: 50,
              height: 30,
              child: ElevatedButton(
                  onPressed: (){
                    SQLHelper.addPlant(plantModel!.data![index].name!, plantModel.data![index].sunLight!, quantity, 'https://lavie.orangedigitalcenteregypt.com${plantModel.data![index].imageUrl!}');
                    Fluttertoast.showToast(msg: 'Plant Added');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Cart()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0))),
                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
            ),
          ),

          plantModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            right: 90,
            bottom: 70,
            width: 75,
            height: 80,
            child: plantModel!.data![index].imageUrl != ''
                ? Image.network('https://lavie.orangedigitalcenteregypt.com${plantModel.data![index].imageUrl!}', )
                : Image.asset('assets/images/plant.jpg')
          )

        ]), itemCount: plantModel?.data?.length,);
  }

  Widget buildGridSeed(SeedModel? seedModel){
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 150
    ), itemBuilder: (context , index) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            width: 800,
            height: 800.0,
            child: Container(),
          ),
          const Positioned(
              top: 20,
              left: 20,
              right: 20,
              bottom: 6,
              child: Card(elevation: 10,)),
          Positioned(
            top: 25,
            left: 20,
            right: 20,
            bottom: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    if (quantity != 1) {
                      quantity = quantity - 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.remove,
                      size: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Text(quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    if (quantity >= 1) {
                      quantity = quantity + 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.add,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          seedModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            top: 80,
            left: 10,
            child: SizedBox(
              height: 85,
              width: 202,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white,),
                    children: [
                      TextSpan(
                        text: '${seedModel!.data![index].name}\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                      TextSpan(
                        text: '${seedModel.data![index].seedId!} EGP',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 8,
            left: 30,
            right: 30,
            child: SizedBox(
              //width: 50,
              height: 30,
              child: ElevatedButton(
                  onPressed: (){
                    SQLHelper.addPlant(seedModel!.data![index].name!, 55, quantity, 'https://lavie.orangedigitalcenteregypt.com${seedModel.data![index].imageUrl!}');
                    Fluttertoast.showToast(msg: 'Plant Added');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Cart()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0))),
                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
            ),
          ),

          seedModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            right: 85,
            bottom: 70,
            width: 75,
            height: 80,
            child: seedModel!.data![index].imageUrl != ''
                ? Image.network('https://lavie.orangedigitalcenteregypt.com${seedModel.data![index].imageUrl!}',)
                : Image.asset('assets/images/seed.jpg')
          )

        ]), itemCount: seedModel?.data?.length,);
  }

  Widget buildGridTool(ToolModel? toolModel){

    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 150
    ), itemBuilder: (context , index) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            width: 800,
            height: 800.0,
            child: Container(),
          ),
          const Positioned(
              top: 20,
              left: 20,
              right: 20,
              bottom: 6,
              child: Card(elevation: 10,)),
          Positioned(
            top: 25,
            left: 20,
            right: 20,
            bottom: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    if (quantity != 1) {
                      quantity = quantity - 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.remove,
                      size: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Text(quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    if (quantity >= 1) {
                      quantity = quantity + 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: lightBlack,borderRadius: BorderRadius.circular(2)),
                    child: const Icon(
                      Icons.add,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          toolModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            top: 80,
            left: 10,
            child: SizedBox(
              height: 85,
              width: 202,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white,),
                    children: [
                      TextSpan(
                        text: '${toolModel!.data![index].name}\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                      TextSpan(
                        text: '${toolModel.data![index].toolId!} EGP',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 8,
            left: 30,
            right: 30,
            child: SizedBox(
              //width: 50,
              height: 30,
              child: ElevatedButton(
                  onPressed: (){
                    SQLHelper.addPlant(toolModel!.data![index].name!, 340, quantity, 'https://lavie.orangedigitalcenteregypt.com${toolModel.data![index].imageUrl!}');
                    Fluttertoast.showToast(msg: 'Plant Added');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Cart()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0))),
                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
            ),
          ),

          toolModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            right: 85,
            bottom: 70,
            width: 75,
            height: 80,
            child: toolModel?.data![index].imageUrl != ''
                ? Image.network('https://lavie.orangedigitalcenteregypt.com${toolModel?.data![index].imageUrl!}',)
                : Image.asset('assets/images/tool.jpg')
          )

        ]), itemCount: toolModel?.data?.length,);
  }

}
