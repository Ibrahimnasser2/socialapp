

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/cach_helper.dart';
import '../../shared/components/tools.dart';
import 'cubit/login_cubit.dart';
import 'cubit/state.dart';
import 'loginpage.dart';

class registerpage extends StatelessWidget {

  var emailcon =TextEditingController();

  var passcon =TextEditingController();
  var phonecon =TextEditingController();

  var namecon =TextEditingController();


  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>login_cubit(),
      child: BlocConsumer<login_cubit,login_states>(
          listener: (context, state){



            if(state is reg_fail_state){
              toast(message: state.error, state: toast_states.fail);

            }

            if(state is create_user_success_state){
              nav_and_finish(context, login());

            }
            // if(state is login_success_state){
            //
            //   if(state.loginmodel!.status==true){
            //     print(state.loginmodel!.message);
            //
            //     toast(message:state.loginmodel!.message, state:toast_states.sucess );
            //     cash_helper.saved_values(key: "token", value:state.loginmodel!.data!.token).then((value){
            //       nav_and_finish(context,loginpage());
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
                            "Register",style: TextStyle(color: Colors.black,fontSize: 30,
                              fontWeight: FontWeight.bold ),),
                          SizedBox(height: 10,),
                          Text(
                            "Register now to communicate with your friends",style: TextStyle(color: Colors.grey,fontSize: 20,),),
                          SizedBox(height: 15,),
                          default_Text_form(
                            controller: namecon,
                            labelText:"Name" ,
                            prefixIcon:Icons.person ,
                            textInputType: TextInputType.name ,),
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
                          default_Text_form(
                            controller: phonecon,
                            labelText:"Phone" ,
                            prefixIcon:Icons.phone ,
                            textInputType: TextInputType.phone ,),


                          SizedBox(height: 10,),
                          Center(
                            child: ConditionalBuilder(
                              builder: (context)=>default_button(function:(){

                                if(formkey.currentState!.validate()){
                                  cubit.user_register(
                                      email: emailcon.text,
                                      pass: passcon.text,
                                      name: namecon.text,
                                      phone: phonecon.text);

                                }

                              } ,text: "Register",),
                              fallback: (context)=>CircularProgressIndicator(),
                              condition: state is! reg_loading_state,

                            ),
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
