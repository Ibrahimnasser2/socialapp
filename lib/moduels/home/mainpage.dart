
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:review/shared/components/tools.dart';

import '../../layout/home/home-cubit/homecubit.dart';
import '../../layout/home/home-cubit/homestates.dart';

class mainpage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<home_cubit,home_states>(
        listener: (context, state){},
        builder: (context, state){


          return Scaffold(body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height:200 ,
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.all(5),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image.network("https://img.freepik.com/free-photo/little-kids-autumn-park_1157-16844.jpg?w=996&t=st=1691005747~exp=1691006347~hmac=12dffdfde486e63a823d507a1c38a9f7243a940988b4c34939832ae3f3967ffa",
                      fit:BoxFit.cover ,
                        width: double.infinity,
                     ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("communicate with friends",style: TextStyle(fontSize: 20,color: Colors.white),),
                      )
                    ],
                  ) ,),
                ),
                SizedBox(height: 5,),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>postbulider(context),
                    separatorBuilder: (context,index)=>SizedBox(height: 8),
                    itemCount: 10)



              ],
            ),
          ));
        });

  }
  Widget postbulider(context)=>Container(


    width: double.infinity,
    child: Card(
      elevation: 5,

      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child:Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://img.freepik.com/free-photo/stylish-man-sitting-barbershop_1157-20487.jpg?w=996&t=st=1691010949~exp=1691011549~hmac=8d35eefcb7dba439c5ecab499fda4f9cb5003451e46cc1455bfd4cf533bcbd37"),


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("camper-man",style: TextStyle(height: 1.5)),
                        SizedBox(width: 5,),
                        Icon(Icons.check_circle,
                          color: Colors.blue,
                          size: 16,)
                      ],
                    ),
                    Text("19-46-ds55420",style: Theme.of(context).textTheme.caption),

                  ],
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),


            ],
          ),
          my_seperatorr(),
          Container(

            width: double.infinity,
            child: Card(

              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text("This page is archived and might not reflect the latest version of the FlutterFire plugins."
                        " You can find the latest information on firebase.google.com.",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        children: [
                          Container(
                            height: 15,
                            child: MaterialButton(onPressed: (){},
                              child: Text("#camper",style: TextStyle(color: Colors.blue)),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              height: 15,
                              minWidth: 1,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: MaterialButton(onPressed: (){},
                              child: Text("#camper",style: TextStyle(color: Colors.blue)),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              height: 15,
                              minWidth: 1,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: MaterialButton(onPressed: (){},
                              child: Text("#camper",style: TextStyle(color: Colors.blue)),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              height: 15,
                              minWidth: 1,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: MaterialButton(onPressed: (){},
                              child: Text("#camper",style: TextStyle(color: Colors.blue)),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              height: 15,
                              minWidth: 1,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: MaterialButton(onPressed: (){},
                              child: Text("#camper",style: TextStyle(color: Colors.blue)),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              height: 15,
                              minWidth: 1,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: MaterialButton(onPressed: (){},
                              child: Text("#camper",style: TextStyle(color: Colors.blue)),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              height: 15,
                              minWidth: 1,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: MaterialButton(onPressed: (){},
                              child: Text("#camper",style: TextStyle(color: Colors.blue)),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              height: 15,
                              minWidth: 1,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("https://as1.ftcdn.net/v2/jpg/01/16/74/30/1000_F_116743065_xqJ1lEsasw85RFmcvKJ0k1MNbWx0G0m4.jpg")
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 3),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Typicons.heart,
                                    color: Colors.red.shade900,
                                    size: 16,),
                                  SizedBox(width: 5,),
                                  Text("120")
                                ],

                              ),
                            ),
                          ),

                          Expanded(
                            child: InkWell(
                              onTap: (){},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Typicons.comment,
                                    color: Colors.amber,
                                    size: 16,),
                                  SizedBox(width: 5,),
                                  Text("120")
                                ],

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  my_seperatorr(),
                  Container(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundImage: NetworkImage("https://img.freepik.com/free-photo/stylish-man-sitting-barbershop_1157-20487.jpg?w=996&t=st=1691010949~exp=1691011549~hmac=8d35eefcb7dba439c5ecab499fda4f9cb5003451e46cc1455bfd4cf533bcbd37"),


                                    ),
                                  ),
                                  Text("write a comment ....",
                                    style:Theme.of(context).textTheme.caption ,),







                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              height: 30,

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Typicons.heart,
                                    color: Colors.red.shade900,
                                    size: 20,),
                                  SizedBox(width: 5,),
                                  Text("like")
                                ],

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),),
          )
        ],
      ),),
  );
}
