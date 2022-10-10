
import 'package:flutter/material.dart';

import 'check_box.dart';
import '../styles/colors.dart';


Widget textFormField({
  required TextEditingController controller,
      required String labelName,
      required TextInputType? keyboardType,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelName, style: const TextStyle(color: textFieldLabel)),
      const SizedBox(height: 10),
      TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(),
          ),)
    ],
  );
}


Widget textFormFieldPass({
  required TextEditingController controller,
  required String labelName,
  TextInputType? keyboardType,
  required bool obscureText,
  required String? Function(String?)? validator
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelName, style: const TextStyle(color: textFieldLabel)),
      const SizedBox(height: 10),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(),

        ),)
    ],
  );
}


Widget or (context, color){
  return Row(
    children: [
      Expanded(child: Divider(thickness: 1, endIndent: 10, indent: MediaQuery.of(context).size.width*.16,) ),
      Text('or continue with', style: TextStyle(letterSpacing: 2, color: color),),
      Expanded(child: Divider(thickness: 1, endIndent: MediaQuery.of(context).size.width*.16, indent: 10,)),
    ],
  );
}


Widget btnAuth({required context, required text}){
  return Container(
    width: MediaQuery.of(context).size.width*.68,
    height: 45,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: primary),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 16.0,
          //fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}


Widget webDontHaveAccouny(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text("Don't have an account", style: TextStyle(letterSpacing: 2,),),
      SizedBox(width: 3,),
      Text('Sign up', style: TextStyle(letterSpacing: 2,color: primary),),
    ],
  );
}

Widget webGoogleFacebook({required text,required imgName, required color}){
  return Container(
    width: 300,
    height: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.grey,
        width: 1,
      ),
    ),
    child: TextButton(
      onPressed: (){
       // navigateTo(context, SignUp());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imgName,width: 12, height: 20,),
          Text(text, style: TextStyle(
            color: color,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    ),
  );
}


Widget webCheckBox(void Function(bool?)? onChanged, void Function()? onTap, context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    SizedBox(
      width: MediaQuery.of(context).size.width*.34,
      child: ListTile(
        leading: Checkbox(value: global.value, onChanged: onChanged),
        title: const Text('Remember me',
          style: TextStyle(fontSize: 14, color: lightBlack),
        ),
      ),
    ),
    InkWell(onTap: onTap, child: const Text('Forget password ?', style: TextStyle(color: primary, decoration: TextDecoration.underline,))
    )
    ],);
}

Widget mobileGoogleFacebook(imgName){
  return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(12),),
      width: 50, height: 50,
      child: Image.asset(imgName,width: 12, height: 20,));
}



void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false
);


void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void popTo(context, widget) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));
}
