import 'package:flutter/material.dart';

class CustomShopSection extends StatelessWidget {
  const CustomShopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100),
      color: Colors.white,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Popular', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    color: Colors.black,
                    height: 2,
                    width: 50,
                  )
                ],
              ),
              const Text('Categories', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))
            ],
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                    ),
                    const Text('Tools', style: TextStyle(color: Colors.black, fontSize: 17)),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Text('Best seller', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                color: Colors.black,
                height: 2,
                width: 50,
              )            ],
          ),
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
                    Text('SPIDER PLANT', style: TextStyle(color: Colors.black, fontSize: 17)),
                    Text('190 EGP', style: TextStyle(color: Colors.black, fontSize: 25,)),
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
                    Text('SPIDER PLANT', style: TextStyle(color: Colors.black, fontSize: 17)),
                    Text('190 EGP', style: TextStyle(color: Colors.black, fontSize: 25,)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
