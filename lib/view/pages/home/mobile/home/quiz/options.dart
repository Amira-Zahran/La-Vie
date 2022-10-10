
import 'package:flutter/material.dart';

import '../../../../../components/styles/colors.dart';

enum SingingCharacter { ans1, ans2,ans3 }

class Options extends StatefulWidget {
  int groupVal=0;

  Options({Key? key}) : super(key: key);


  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  SingingCharacter? _character = SingingCharacter.ans2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: primary,
            ),

          ),
          child: ListTile(
            title: const Text('The user experience is how the developer feels about a user',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            trailing: Transform.scale(
              scale: 1.3,
              child: Radio<SingingCharacter>(
                activeColor: primary,
                splashRadius: 1,

                value: SingingCharacter.ans1,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.zero,

          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: primary,
              )

          ),
          child: ListTile(
            title: const Text('The user experience is how the user feels about interacting with or experiencing a product',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            trailing: Transform.scale(
              scale: 1.3,
              child: Radio<SingingCharacter>(
                activeColor: primary,
                splashRadius: 1,

                value: SingingCharacter.ans2,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: primary,
              )

          ),
          child: ListTile(
            title: const Text('The user experience is the attitude the UX designer has about a product.',

              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            trailing: Transform.scale(
              scale: 1.3,
              child: Radio<SingingCharacter>(
                activeColor: primary,
                splashRadius: 1,

                value: SingingCharacter.ans3,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
