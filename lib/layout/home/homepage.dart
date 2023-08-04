
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/shared/components/tools.dart';

import '../../moduels/home/posts.dart';
import 'home-cubit/homecubit.dart';
import 'home-cubit/homestates.dart';

class homepage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<home_cubit,home_states>(
      listener: (context, state){

        if(state is newpostpage_success_data_state){
          navigate_to(context, posts());
        }
      },
      builder: (context, state){
        home_cubit cubit=home_cubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text(
            "News feed",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
            actions: [
              IconButton(onPressed: (){

              }, icon: Icon(Icons.notifications_none_outlined,
                color: Colors.black,)),
              IconButton(onPressed: (){

              }, icon: Icon(Icons.search,
                color: Colors.black,)),

            ],

          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                // ConditionalBuilder(
                //   builder: (context)=>Column(
                //     children: [
                //       if(!FirebaseAuth.instance.currentUser!.emailVerified)
                //       Container(
                //         width: double.infinity,
                //         height: 40,
                //         color: Colors.amberAccent,
                //         child: Center(
                //           child: Padding(
                //             padding: const EdgeInsets.all(5.0),
                //             child: Row(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Icon(Icons.info),
                //                 SizedBox(width: 5),
                //
                //                 Text("please verify your email",
                //                   style: TextStyle(fontSize: 20),),
                //                 Spacer(),
                //                 default_button(function: (){
                //                   FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value){
                //
                //                     toast(message: "chuck your email", state: toast_states.sucess);
                //
                //
                //                   }).
                //                   catchError((error){});
                //
                //
                //                 },
                //                     text: "send",
                //                     width: 100,
                //                     back_ground:Colors.transparent,
                //                     textcolor: Colors.blue
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   condition: true,
                //   fallback: (context)=>Center(child: CircularProgressIndicator()),
                //
                // ),

              Expanded(child: cubit.home_pages[cubit.current_page]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomitem,
            onTap: (index){
              cubit.change_bottom_index(value: index);


            },

            currentIndex: cubit.current_page,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          ) ,
        );
      },



    );
  }
}
