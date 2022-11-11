import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lavie_web/view/components/home_mobile/home_component.dart';

import '../../../../../model/home/cart_model.dart';
import '../../../../../view_model/database/local/SQLITE_DB/database.dart';
import '../../../../components/styles/colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<Plants> allPlants = [];

  int quantity = 1;

  Plants? plantDetail;


  @override
  void initState(){
    super.initState();
    SQLHelper.initDb();
    getAllPlants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black,),
        title: const Text('My Cart',
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: allPlants.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/Frame.png'), width: 200,height: 200,),
            SizedBox(height: 30,),
            Text('Your cart is empty', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            SizedBox(height: 20,),
            SizedBox(
                width: 300,
                height: 75,
                child: Text('Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: darkGreyColor,
                  ),)
            )
          ],
        ),
      )
          : Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>  Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      Image.network(allPlants[index].img),
                      Column(
                        children: [
                          Text(allPlants[index].name),
                          Text(allPlants[index].price, style: const TextStyle(color: primary),),
                          Row(
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
                                    color: primary,
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
                                    color: primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(onPressed: (){
                        SQLHelper.deletePlant(plantDetail!.id);
                        Fluttertoast.showToast(msg: 'Plant Deleted');
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Cart()));
                      }, icon: const Icon(Icons.delete, color: primary,))
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total'),
                        Text(allPlants[index].price * quantity, style: const TextStyle(color: primary),)
                      ],
                    ),
                    SizedBox(
                        width: 200, height: 200,
                        child: customBtn(forColor: primary, backColor: primary, color: primary, onPressed: (){}, text: 'Checkout', textColor: Colors.white))
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  void getAllPlants()  {
    //todo get plants from db
    SQLHelper.getPlants().then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          allPlants.add(Plants.fromDbMap(value[i]));
        });
      }
    });
  }
}
