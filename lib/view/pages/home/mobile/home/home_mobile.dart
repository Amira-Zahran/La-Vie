import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/view/components/styles/colors.dart';
import 'package:lavie_web/view_model/cubit/home/home_cubit.dart';
import 'package:lavie_web/view_model/cubit/states.dart';
import 'package:intl/intl.dart';

import '../../../../../model/home/plant_model.dart';
import '../../../../../model/home/products_model.dart';
import '../../../../../model/home/seed_model.dart';
import '../../../../../model/home/tool_model.dart';
import '../../../../components/auth/auth_components.dart';
import 'cart.dart';
import 'quiz/quiz_questions.dart';
import 'search.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();

}

class _HomeMobileState extends State<HomeMobile> {

  int activeButton = 0;

  //model = Products;

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
//            ForumsCubit myForums = ForumsCubit.get(context);
        //var products = Products as List<Map>;
        return  SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              InkWell(
                onTap: (){
                  navigateAndFinish(context, const QuizQuestions());
                },
                child: Visibility( // show or hide widget
                //visible: (dateFormat == 'Monday') ? true : false,
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
              Image.asset('assets/logo.png', width: 102, height: 23,),
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
                  width: 63,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: (activeButton == 0 /*e.id*/ ? lightBlack : primary), backgroundColor: (activeButton == 0 ? Colors.white : lightGrey),
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          color: (activeButton == 0 ? primary : lightGrey),
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: ((){
                      setState(() {
                        activeButton = 0;
                      });
                    }),
                    child: Text('All', style: TextStyle(color: (activeButton == 0 ? primary : darkGreyColor),fontWeight: FontWeight.bold,)),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: (activeButton == 1 ? green
                          : primary), backgroundColor: (activeButton == 1 ? Colors.white : lightGrey),
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          color: (activeButton == 1 ? primary : lightGrey),
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: ((){
                      setState(() {
                        activeButton = 1;
                      });
                    }),
                    child: Text('Plants', style: TextStyle(color: (activeButton == 1 ? primary : darkGreyColor),fontWeight: FontWeight.bold,)),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: (activeButton == 2 ? lightBlack : primary), backgroundColor: (activeButton == 2 ? Colors.white : lightGrey),
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          color: (activeButton == 2 ? primary : lightGrey),
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: ((){
                      setState(() {
                        activeButton = 2;
                      });
                    }),
                    child: Text('Seeds', style: TextStyle(color: (activeButton == 2 ? primary
                        : darkGreyColor),fontWeight: FontWeight.bold,)),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: (activeButton == 3 ? lightBlack
                          : primary), backgroundColor: (activeButton == 3 ? Colors.white : lightGrey),
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          color: (activeButton == 3 ? primary : lightGrey),
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: ((){
                      setState(() {
                        //widget.onFilterChanged!(e.id!);
                        activeButton = 3;
                      });
                    }),
                    child: Text('Tools', style: TextStyle(color: (activeButton == 3 ? primary
                        : darkGreyColor),fontWeight: FontWeight.bold, )),
                  ),
                ),
              ],),
          ),
              const SizedBox(height: 30,),
/*
               Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const BouncingScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.9,
                  children: List.generate(
                    Products.AllProducts.length, (index) => AllProducts(Products.AllProducts[index] , this.context),
                  ),
                ),
              ),
*/

             /* Expanded(
              child: myHome.productsModel == null ? const CircularProgressIndicator() : GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 0.55,
                children: List.generate(myHome.productsModel!.data!.length, (index) {
                  if(activeButton == 0){
                   buildGridProducts(allProducts: myHome.productsModel!.data![index]);
                  } else if(activeButton == 1){
                    getPlant(plantData: myHome.plantModel!.data![index]);
                  }else if(activeButton == 2){
                    getPlant(plantData: myHome.plantModel!.data![index]);
                  }else if(activeButton == 3){
                    getPlant(plantData: myHome.plantModel!.data![index]);
                  }

                  return const Center(child: CircularProgressIndicator(color: primary,));
                }
                ),
              )
          )*/

           /*   Expanded(child: GridView.count(
                crossAxisCount: 2,
                children:[
                  Stack(
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
                          top: 23,
                          left: 20,
                          right: 20,
                          bottom: 0,
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

                        myHome.productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
                          top: 100,
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
                                      text: '${myHome.productModel!.data![2].name}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${myHome.productModel!.data![2].price!} EGP',
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
                          bottom: 5,
                          left: 30,
                          right: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0))),
                                child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                          ),
                        ),

                        myHome.productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
                          right: 50,
                          bottom: 95,
                          width: 150,
                          height: 110,
                          child: Image.network('https://lavie.orangedigitalcenteregypt.com${myHome.productModel!.data![1].imageUrl!}',
                          ),)

                      ]),
                  Stack(
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
                          top: 23,
                          left: 20,
                          right: 20,
                          bottom: 0,
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
                        Positioned(
                        top: 100,
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
                                    text: '${myHome.productModel!.data![2].name}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 12
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${myHome.productModel!.data![2].price!} EGP',
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
                          bottom: 5,
                          left: 30,
                          right: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0))),
                                child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                          ),
                        ),
                        Positioned(
                        right: 50,
                        bottom: 90,
                        width: 150,
                        height: 110,
                        child: Image.network('https://lavie.orangedigitalcenteregypt.com${myHome.productModel!.data![2].imageUrl!}',
                        ),)
                      ]),
                  Stack(
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
                          top: 23,
                          left: 20,
                          right: 20,
                          bottom: 0,
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

                        myHome.productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
                          top: 100,
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
                                      text: '${myHome.productModel!.data![2].name}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${myHome.productModel!.data![2].price!} EGP',
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
                          bottom: 5,
                          left: 30,
                          right: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0))),
                                child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                          ),
                        ),

                        myHome.productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
                          right: 50,
                          bottom: 95,
                          width: 150,
                          height: 110,
                          child: Image.network('https://lavie.orangedigitalcenteregypt.com${myHome.productModel!.data![1].imageUrl!}',
                          ),)

                      ]),
                  Stack(
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
                          top: 23,
                          left: 20,
                          right: 20,
                          bottom: 0,
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
                        Positioned(
                          top: 100,
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
                                      text: '${myHome.productModel!.data![2].name}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${myHome.productModel!.data![2].price!} EGP',
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
                          bottom: 5,
                          left: 30,
                          right: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0))),
                                child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          bottom: 90,
                          width: 150,
                          height: 110,
                          child: Image.network('https://lavie.orangedigitalcenteregypt.com${myHome.productModel!.data![2].imageUrl!}',
                          ),)
                      ]),
                  Stack(
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
                          top: 23,
                          left: 20,
                          right: 20,
                          bottom: 0,
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

                        myHome.productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
                          top: 100,
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
                                      text: '${myHome.productModel!.data![2].name}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${myHome.productModel!.data![2].price!} EGP',
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
                          bottom: 5,
                          left: 30,
                          right: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0))),
                                child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                          ),
                        ),

                        myHome.productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
                          right: 50,
                          bottom: 95,
                          width: 150,
                          height: 110,
                          child: Image.network('https://lavie.orangedigitalcenteregypt.com${myHome.productModel!.data![1].imageUrl!}',
                          ),)

                      ]),
                  Stack(
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
                          top: 23,
                          left: 20,
                          right: 20,
                          bottom: 0,
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
                        Positioned(
                          top: 100,
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
                                      text: '${myHome.productModel!.data![2].name}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${myHome.productModel!.data![2].price!} EGP',
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
                          bottom: 5,
                          left: 30,
                          right: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0))),
                                child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          bottom: 90,
                          width: 150,
                          height: 110,
                          child: Image.network('https://lavie.orangedigitalcenteregypt.com${myHome.productModel!.data![2].imageUrl!}',
                          ),)
                      ]),

              ])),*/
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
            top: 23,
            left: 20,
            right: 20,
            bottom: 0,
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
            top: 100,
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
            bottom: 5,
            left: 30,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton(
                  onPressed: (){

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
            right: 50,
            bottom: 95,
            width: 150,
            height: 110,
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
            top: 23,
            left: 20,
            right: 20,
            bottom: 0,
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
            top: 100,
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
            bottom: 5,
            left: 30,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton(
                  onPressed: (){

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
            right: 50,
            bottom: 95,
            width: 150,
            height: 110,
            child: Image.network('https://lavie.orangedigitalcenteregypt.com${plantModel?.data![index].imageUrl!}',
            ),)

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
            top: 23,
            left: 20,
            right: 20,
            bottom: 0,
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
            top: 100,
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
            bottom: 5,
            left: 30,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton(
                  onPressed: (){

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
            right: 50,
            bottom: 95,
            width: 150,
            height: 110,
            child: Image.network('https://lavie.orangedigitalcenteregypt.com${seedModel?.data![index].imageUrl!}',
            ),)

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
            top: 23,
            left: 20,
            right: 20,
            bottom: 0,
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
            top: 100,
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
            bottom: 5,
            left: 30,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton(
                  onPressed: (){

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
            right: 50,
            bottom: 95,
            width: 150,
            height: 110,
            child: Image.network('https://lavie.orangedigitalcenteregypt.com${toolModel?.data![index].imageUrl!}',
            ),)

        ]), itemCount: toolModel?.data?.length,);
  }



/*
  Widget buildGridProducts({required ProductData Product}){
    return Stack(
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
            top: 23,
            left: 20,
            right: 20,
            bottom: 0,
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

          produ?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            top: 130,
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
                        text: '${myHome.productModel!.data![2].name}\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),
                      TextSpan(
                        text: '${myHome.productModel!.data![2].price!} EGP',
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
            bottom: 10,
            left: 30,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton(
                  onPressed: (){

                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0))),
                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
            ),
          ),

          myHome.productModel?.data == null ? const Center(child: CircularProgressIndicator(color: primary,)) : Positioned(
            right: 80,
            bottom: 95,
            width: 150,
            height: 110,
            child: Image.network('https://lavie.orangedigitalcenteregypt.com${myHome.productModel!.data![1].imageUrl!}',
            ),)

        ]);
  }
*/
/*
  Widget getPlant({required PlantData plantData}){
    HomeCubit myPlant = HomeCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit()..getPlant(); },
      child: BlocConsumer(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit myPlant = HomeCubit.get(context);
          return Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                myPlant.plantModel!.data!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
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
                            top: 23,
                            left: 20,
                            right: 20,
                            bottom: 0,
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
                          Positioned(
                            top: 130,
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
                                        text: '${myPlant.plantModel!.data![0].name}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${myPlant.plantModel!.data![0].plantId} EGP',
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
                            bottom: 10,
                            left: 30,
                            right: 30,
                            child:
GetBuilder<CartViewModel>(
                                              init: CartViewModel(),
                                              builder: (controller) =>

                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: ElevatedButton(
                                  onPressed: (){

                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0))),
                                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                            ),
                          ),
                          Positioned(
                            right: 80,
                            bottom: 95,
                            width: 150,
                            height: 110,
                            child: Image.network(myPlant.plantModel!.data![0].imageUrl!,
                            ),)
                        ]),
                  )
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getSeed({required PlantData plantData}){
    HomeCubit myPlant = HomeCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit()..getPlant(); },
      child: BlocConsumer(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit myPlant = HomeCubit.get(context);
          return Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                  myPlant.plantModel!.data!.length,
                      (index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
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
                            top: 23,
                            left: 20,
                            right: 20,
                            bottom: 0,
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
                          Positioned(
                            top: 130,
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
                                        text: '${myPlant.plantModel!.data![0].name}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${myPlant.plantModel!.data![0].plantId} EGP',
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
                            bottom: 10,
                            left: 30,
                            right: 30,
                            child:
GetBuilder<CartViewModel>(
                                              init: CartViewModel(),
                                              builder: (controller) =>

                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: ElevatedButton(
                                  onPressed: (){

                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0))),
                                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                            ),
                          ),
                          Positioned(
                            right: 80,
                            bottom: 95,
                            width: 150,
                            height: 110,
                            child: Image.network(myPlant.plantModel!.data![0].imageUrl!,
                            ),)
                        ]),
                  )
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getTools({required PlantData plantData}){
    HomeCubit myPlant = HomeCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit()..getPlant(); },
      child: BlocConsumer(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit myPlant = HomeCubit.get(context);
          return Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                  myPlant.plantModel!.data!.length,
                      (index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
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
                            top: 23,
                            left: 20,
                            right: 20,
                            bottom: 0,
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
                          Positioned(
                            top: 130,
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
                                        text: '${myPlant.plantModel!.data![0].name}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${myPlant.plantModel!.data![0].plantId} EGP',
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
                            bottom: 10,
                            left: 30,
                            right: 30,
                            child:
GetBuilder<CartViewModel>(
                                              init: CartViewModel(),
                                              builder: (controller) =>

                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: ElevatedButton(
                                  onPressed: (){

                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0))),
                                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 14))),
                            ),
                          ),
                          Positioned(
                            right: 80,
                            bottom: 95,
                            width: 150,
                            height: 110,
                            child: Image.network(myPlant.plantModel!.data![0].imageUrl!,
                            ),)
                        ]),
                  )
              ),
            ),
          );
        },
      ),
    );
  }*/

}
