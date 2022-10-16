

import 'package:contact_db/database/dbhelper.dart';
import 'package:contact_db/screens/bottomsheet.dart';
import 'package:contact_db/screens/contact_details.dart';

import 'package:flutter/material.dart';

import '../modal/contactmodel.dart';
class MyContacts extends StatefulWidget {


  @override
  State<MyContacts> createState() => _MyContactsState();
}
List<ContactModel>contactslist=[];

class _MyContactsState extends State<MyContacts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
     Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Color(0xff0977cb),
         title: Text('My Contacts',style: Theme.of(context).textTheme.titleLarge,),
       ),
       body: FutureBuilder<List<ContactModel>>(
         future: DbHelper.instance.allcontacts(),
         builder: (context,AsyncSnapshot snapshot){
           if(snapshot.hasError){
                  return Center(child: Text('you have '+snapshot.error.toString()),
                  );
           }
           if(snapshot.hasData){
               contactslist=snapshot.data!;
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: GridView.builder(
                   scrollDirection: Axis.vertical,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     mainAxisSpacing: 8,
                     crossAxisSpacing: 8,
                   ),
                   itemCount:contactslist.length,
                   itemBuilder: (context,index){
                          ContactModel contactobj=contactslist[index];
                     return GestureDetector(
                       onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (BuildContext context) =>  ContactDetails(contactobj),
                           ),
                         );
                       },
                       child: Padding(padding: EdgeInsets.all(8),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 image: DecorationImage(
                                   image: NetworkImage(
                                       contactobj.imageurl),
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                             Text(contactobj.name),
                             Text(contactobj.number.toString()),
                           ],
                         ),
                       ),
                     );
                   },


                 ),
               );
           }
           return Center(
               child: Container(
                   height: 100,
                   width: 100,
                   child: CircularProgressIndicator()));

         },

       ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){
                showModalBottomSheet(context: context, builder:(context){
                  return CustomBottomSheet();
           },
                  isScrollControlled: true,
          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
           topLeft: Radius.circular(20)
           ),
           ),
           );
         },
         child: Icon(Icons.add),
       ),
     ) ,

    );
  }
}

