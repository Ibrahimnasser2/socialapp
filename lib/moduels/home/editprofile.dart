
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/layout/login/loginpage.dart';
import 'package:review/network/local/cach_helper.dart';
import 'package:review/shared/components/tools.dart';

import '../../layout/home/home-cubit/homecubit.dart';
import '../../layout/home/home-cubit/homestates.dart';

class editprofile extends StatelessWidget {
  var namelcon =TextEditingController();

  var biocon =TextEditingController();



  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<home_cubit,home_states>(
        listener: (context, state){},
        builder: (context, state){
          home_cubit cubit=home_cubit.get(context);


          return Scaffold(appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Edit Profile"),
            ),
            actions: [
              default_button(function: (){}, text: "update",back_ground: Colors.transparent,width: 100,textcolor: Colors.blue)
            ],
          ),
              body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      child:  Stack(
                        alignment: AlignmentDirectional.topEnd,

                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 160,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),

                                      image: DecorationImage(
                                          fit: BoxFit.fill,

                                          image: cubit.coverimage==null?NetworkImage("${cubit.loginmodel!.cover}"):FileImage(cubit.coverimage!)as ImageProvider

                                      )),

                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 53,
                                    backgroundColor: Colors.white,
                                    child:CircleAvatar(
                                      radius: 50,

                                      backgroundImage:  cubit.profileimage==null?NetworkImage("${cubit.loginmodel!.image}"):FileImage(cubit.profileimage!)as ImageProvider ,


                                    ) ,),
                                  CircleAvatar(
                                    radius:15,
                                    child: IconButton(icon:Icon(Icons.camera_alt_outlined,
                                        size: 20) ,onPressed:(){
                                      cubit.getprofileImage();


                                    },padding: EdgeInsets.zero, ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              radius:16,
                              child: IconButton(icon:Icon(Icons.camera_alt_outlined,
                                  size: 20) ,onPressed:(){
                                cubit.getcoverimage();

                              },padding: EdgeInsets.zero, ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    default_Text_form(
                      controller: namelcon,
                      labelText:"Name" ,
                      prefixIcon:Icons.person ,
                      textInputType: TextInputType.name ,),
                    SizedBox(height: 7,),
                    default_Text_form(
                      controller: namelcon,
                      labelText:"Bio" ,
                      prefixIcon:Icons.info ,
                      textInputType: TextInputType.text ,),

                  ],
                ),
              ),
            ),
          ));
        }
    );

  }
}



