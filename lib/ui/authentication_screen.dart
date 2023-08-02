import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pingolearn/api/firebase_api.dart';
import 'package:pingolearn/provider/auth_provider.dart';
import 'package:pingolearn/ui/news_list.dart';
import 'package:provider/provider.dart';

import '../resources/custom_colors.dart';
import '../widgets/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<AuthScreen> {






  @override
  Widget build(BuildContext context) {

    final myToggleModel = Provider.of<MyToggleModel>(context, listen: true);
    return  Scaffold(

      backgroundColor: CustomColors.litegray,


      body: myToggleModel.isToggled!=false? loginWidget(myToggleModel) :  signinWidget(myToggleModel),
    );
  }






  Widget signinWidget(MyToggleModel myToggleModel){

    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [


        Column(
          children: [

            MyTextFieldWidget(textEditingController: _nameController, label: 'Name', hint: 'Enter Your Name', obscureText: false,),
            SizedBox(height: 16),
            MyTextFieldWidget(textEditingController: _emailController, label: 'Email', hint: 'Enter Your Email', obscureText: false,),
            SizedBox(height: 16),
            MyTextFieldWidget(textEditingController: _passwordController, label: 'Password', hint: 'Enter Your Password', obscureText: true,),
            SizedBox(height: 10),
          ],
        ),



        Column(
          children: [

            Container(
              width: 180,
              height: 40,
              child: ElevatedButton(
                onPressed:() { if( _nameController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){ FirebaseAPIs.signInWithEmailAndPassword(context,_emailController, _passwordController); } else if( _nameController.text.toString().isEmpty || _emailController.text.toString().isEmpty || _passwordController.text.toString().isEmpty){ showValidationToast();}},

                child: Text('Sign In',style: TextStyle(fontFamily: 'Poppins'),),
                style: ElevatedButton.styleFrom(backgroundColor: CustomColors.blue),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',style: TextStyle(fontFamily: 'Poppins',color: CustomColors.darkgray),),
                InkWell(
                  child: Text(' Login',style: TextStyle(color: CustomColors.blue,fontFamily: 'Poppins'),),
                  onTap: (){
                   myToggleModel.toggle();
                 },),
              ],
            )

          ],
        ),




      ],
    );
  }




  Widget loginWidget(MyToggleModel myToggleModel){


    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Column(
          children: [

            MyTextFieldWidget(textEditingController: _emailController, label: 'Email', hint: 'Enter Your Email', obscureText: false,),
            SizedBox(height: 16),
            MyTextFieldWidget(textEditingController: _passwordController, label: 'Password', hint: 'Enter Your Password', obscureText: true,),
            SizedBox(height: 16),
          ],
        ),

        Column(
          children: [

            Container(
              width: 190,
              height: 40,
              child: ElevatedButton(
                onPressed:() {if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){ FirebaseAPIs.logInWithEmailAndPassword(context,_emailController, _passwordController); } else if(_emailController.text.toString().isEmpty || _passwordController.text.toString().isEmpty){ showValidationToast();}},
                child: Text('Log In',style: TextStyle(fontFamily: 'Poppins'),),
                style: ElevatedButton.styleFrom(backgroundColor: CustomColors.blue),
              ),
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New Here? ',style: TextStyle(fontFamily: 'Poppins',color: CustomColors.darkgray),),
                InkWell(
                  child: Text(' Signup',style: TextStyle(color: CustomColors.blue,fontFamily: 'Poppins'),),
                  onTap: (){
                    myToggleModel.toggle();
                  },),
              ],
            )

          ],
        ),



      ],
    );
  }


  void showValidationToast() {
    Fluttertoast.showToast(
      msg: 'Please fill the details.',
      toastLength: Toast.LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration.
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1, // Time duration for iOS and web (in seconds).
      backgroundColor: Colors.grey[700],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }



}
