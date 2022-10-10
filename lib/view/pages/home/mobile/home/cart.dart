import 'package:flutter/material.dart';

import '../../../../components/styles/colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
      body: Center(
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
      ),);
  }
}
