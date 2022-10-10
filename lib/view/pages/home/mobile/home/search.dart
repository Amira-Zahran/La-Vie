import 'package:flutter/material.dart';

import '../../../../components/styles/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Container(
            width: MediaQuery.of(context).size.width *.8,
            height: 45,
            decoration: BoxDecoration(color: lightBlack, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: TextField(
                controller: searchController,
                onChanged: (v){
                  setState((){});
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,color: darkGreyColor),
                  hintStyle: TextStyle(color: darkGreyColor,
                    fontFamily: "Cairo_Regular",
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Search',
                ),
                textAlignVertical: TextAlignVertical.center,
              ),

              /*appBar: AppBar(
                            backgroundColor: Colors.grey,
                            title: TextField(
                                controller:SearchCTRL,
                                onChanged: (v){
                                  setState((){});
                                },
                                decoration: InputDecoration(
                                  //prefix: Icon(Icons.search,color: Config.ButtonColor),
                                  prefixIcon: const Icon(Icons.search,color: Colors.deepPurpleAccent),
                                  fillColor: Colors.grey,
                                  //filled: true,
                                  hintStyle: const TextStyle(color: Colors.black87,
                                    fontFamily: "Cairo_Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  hintText: 'Search',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.grey)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.grey)
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.grey)
                                  ),
                                )
                            ),
                            centerTitle: true,
                          ),*/
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width *.6),
            child: const Text('Recent searches',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16, color: darkGreyColor),),
          ),
          const SizedBox(height: 20,),

          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width *.06, right: MediaQuery.of(context).size.width *.06),
            child: const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Plants',
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 17, color: darkGreyColor)),
              //subtitle: Text('Yesterday 5 PM'),
              trailing: Icon(Icons.close),
            ),
          ),

        ],
      ),
    );
  }
}
