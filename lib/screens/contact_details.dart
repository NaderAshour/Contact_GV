


import 'package:contact_db/database/dbhelper.dart';
import 'package:contact_db/modal/contactmodel.dart';
import 'package:flutter/material.dart';
class ContactDetails extends StatefulWidget {
  ContactModel contact;
  ContactDetails(this.contact);
  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  TextEditingController dename=TextEditingController();
  TextEditingController denumber=TextEditingController();
  TextEditingController deimage=TextEditingController();
  @override
  void initState() {
    super.initState();
    dename.text=widget.contact.name;
    denumber.text=widget.contact.number.toString();
    deimage.text=widget.contact.imageurl;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                  color: Colors.blue[500],
                  child: Center(child: Text('Contact Details',style: Theme.of(context).textTheme.titleLarge,))),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://scontent.faly8-2.fna.fbcdn.net/v/t39.30808-6/217946012_2909788445931365_185904278134005682_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=LRSKGaYakLMAX88oTdJ&_nc_ht=scontent.faly8-2.fna&oh=00_AT-WiGmbkaEEVTKvebCRsaLwVWLKKnI66QeGd5UDlpeQ7w&oe=634AD199'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              TextField(

                controller: dename,
                decoration: InputDecoration(
                    hintText: 'Enter Contact name',
                    labelText: 'Name'
                ),

              ),
              SizedBox(height: 15,),
              TextField(
                controller: denumber,
                decoration: InputDecoration(
                    hintText: 'Enter Contact number',
                    labelText: 'Number'
                ),

              ),
              SizedBox(height: 15,),
              TextField(

                controller: deimage,
                decoration: InputDecoration(
                    hintText: 'Enter Contact Image Url',
                    labelText: 'Image'
                ),


                

              ),
              SizedBox(height: 15,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: TextButton(
                   child: Text('Save',style:
                   Theme.of(context).textTheme.button),
                   onPressed: ()async{
               /*  var updatedCourse = ContactModel({
                  columnId: widget.contact.id,
                  columnName:dename.text,
                   columnNumber : int.parse(denumber.text),
                   columnImage:deimage.text,
                    });*/
               await  DbHelper.instance.courseUpdate(widget.contact);
                 Navigator.of(context).pop();
                     }
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.redAccent,
                child: TextButton(
                  child: Text('delete',style: Theme.of(context).textTheme.button,),
                    onPressed:(){
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(

                            title: Text('Delete'),
                            content: Text('Are You sure you want to delete this item'),
                            actions: [
                              MaterialButton(
                                child: Text('Cancel'),
                                onPressed:()
                                {
                                  Navigator.of(context).pop();
                                },
                              ),
                              MaterialButton(
                                child: Text('Yes'),
                                onPressed:() async{
                                  await DbHelper.instance.removetodo(int.parse(widget.contact.id.toString()));
                                  Navigator.of(context).pop();
                                },
                              ),

                            ],
                          );

                        },

                      );
                    }
                ),

              ),],
          ),
        ),
      ),
    );

  }
}
