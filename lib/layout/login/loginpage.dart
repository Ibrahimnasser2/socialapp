
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:review/layout/home/homepage.dart';
import 'package:review/layout/login/cubit/login_cubit.dart';
import 'package:review/layout/login/cubit/state.dart';
import 'package:review/layout/login/regpage.dart';

import 'package:review/network/local/cach_helper.dart';
import 'package:review/shared/components/tools.dart';




class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  var emailcon =TextEditingController();

  var passcon =TextEditingController();



  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>login_cubit(),
      child: BlocConsumer<login_cubit,login_states>(
          listener: (context, state)  {
            if(state is login_fail_state){
             toast(message: state.error, state: toast_states.fail);

            }




            if(state is login_success_state){
              cash_helper.saved_values(key: "token", value:state.id).then((value){
                nav_and_finish(context,homepage());
              });

            }


            // if(state is login_success_state){
            //
            //   if(state.loginmodel!.status==true){
            //     print(state.loginmodel!.message);
            //
            //     toast(message:state.loginmodel!.message, state:toast_states.sucess );
            //     cash_helper.saved_values(key: "token", value:state.loginmodel!.data!.token).then((value){
            //       nav_and_finish(context,shop_layout());
            //     });
            //
            //
            //
            //
            //   }
            //   else{
            //     toast(message:state.loginmodel!.message, state:toast_states.fail );
            //
            //   }
            //
            // }

          },
          builder: (context, state){
            login_cubit cubit= login_cubit.get(context);
            return Scaffold(appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: formkey,
                      child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
                        children: [
                          Text(
                            "Login",style: TextStyle(color: Colors.black,fontSize: 30,
                              fontWeight: FontWeight.bold ),),
                          SizedBox(height: 10,),
                          Text(
                            "login now to browse our hot offer",style: TextStyle(color: Colors.grey,fontSize: 20,),),
                          SizedBox(height: 10,),
                          default_Text_form(
                            controller: emailcon,
                            labelText:"E-mail address" ,
                            prefixIcon:Icons.email ,
                            textInputType: TextInputType.emailAddress ,),
                          SizedBox(height: 10,),
                          default_Text_form(
                            controller: passcon,
                            labelText:"password" ,
                            prefixIcon:Icons.lock_outline ,
                            textInputType: TextInputType.visiblePassword ,
                            ispassword: cubit.ispass,
                            suffixIcon: IconButton(onPressed: (){
                              cubit.password_cahnge();
                            }, icon: Icon(cubit.suff)

                              ,),
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: ConditionalBuilder(
                              builder: (context)=>default_button(function:(){
                                emailcon.text="hema01153421455@gmail.com";
                                passcon.text="hema01153421455@gmail.com";

                                if(formkey.currentState!.validate()){
                                  login_cubit.get(context).user_login(

                                      email: emailcon.text,
                                      pass: passcon.text);

                                }

                              } ,text: "Login",),
                              fallback: (context)=>CircularProgressIndicator(),
                              condition: state is! login_loading_state,

                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(children: [
                              Text(
                                "Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 18,),),
                              TextButton(onPressed: ()=> navigate_to(context,registerpage()),
                                  child: Text(
                                    "Register",style: TextStyle(color: Colors.blue,fontSize: 18),)),
                            ],),
                          ),




                        ],),
                    ),
                  ),
                ),
              ) ,);
          }

      ),
    );
  }
}
