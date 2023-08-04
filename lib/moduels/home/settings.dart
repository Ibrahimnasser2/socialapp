
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/layout/login/loginpage.dart';
import 'package:review/moduels/home/editprofile.dart';
import 'package:review/network/local/cach_helper.dart';
import 'package:review/shared/components/tools.dart';

import '../../layout/home/home-cubit/homecubit.dart';
import '../../layout/home/home-cubit/homestates.dart';

class settings extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<home_cubit,home_states>(
      listener: (context, state){

      },
    builder: (context, state){
        home_cubit cubit=home_cubit.get(context);
          return Scaffold(body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                      children: [
                Container(
                  height: 190,
                  child: Stack(
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

                                  image: NetworkImage("${cubit.loginmodel!.cover}"))),

                        ),
                      ),
                      CircleAvatar(
                        radius: 53,
                        backgroundColor: Colors.white,
                        child:CircleAvatar(
                          radius: 50,

                          backgroundImage: NetworkImage("${cubit.loginmodel!.image}"),


                        ) ,)
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${cubit.loginmodel!.name}",style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("${cubit.loginmodel!.bio}",style: Theme.of(context).textTheme.caption),
                      ),
                    ],
                  ),
                ),
               SizedBox(height: 5,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("256",style: Theme.of(context).textTheme.titleLarge),
                              SizedBox(height: 10,),
                              Text("photos",style: Theme.of(context).textTheme.caption),
                            ],

                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("100",style: Theme.of(context).textTheme.titleLarge),
                              SizedBox(height: 10,),
                              Text("posts",style: Theme.of(context).textTheme.caption),
                            ],

                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("5m",style: Theme.of(context).textTheme.titleLarge),
                              SizedBox(height: 10,),
                              Text("followers",style: Theme.of(context).textTheme.caption),
                            ],

                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("3k",style: Theme.of(context).textTheme.titleLarge),
                              SizedBox(height: 10,),
                              Text("followers",style: Theme.of(context).textTheme.caption),
                            ],

                          ),
                        ),
                        Spacer(),

                      ],

                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: (){}, child:Text("add photos") )),
                    SizedBox(width: 10,),
                    OutlinedButton(onPressed: (){
                      navigate_to(context, editprofile());
                    }, child: Icon(Icons.edit), )
                  ],
                ),

                SizedBox(height: 100,),
                default_button(function: (){
                    cash_helper.removedata(key: "token").then((value) {
                      nav_and_finish(context, login());
                    }).catchError((error){
                      print(error);
                    });

                    }, text: "logout")
                    ],
                    ),
          ));
              }
              );

     }
}



