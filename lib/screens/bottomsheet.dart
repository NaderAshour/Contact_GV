import 'package:contact_db/database/dbhelper.dart';
import 'package:contact_db/modal/contactmodel.dart';
import 'package:contact_db/screens/contact_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController image=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              onChanged: (String newname){
                name.text=newname;
              },
              controller: name,
              decoration: InputDecoration(
                  hintText: 'Enter Contact name',
                  labelText: 'Name'
              ),

            ),
            TextField(
              onChanged: (String newnumber){
                number.text=newnumber;
              },
              controller: number,
              decoration: InputDecoration(
                  hintText: 'Enter Contact number',
                  labelText: 'Number'
              ),

            ),
            TextField(
              onChanged: (String newUrl){
                image.text=newUrl;
              },
              controller: image,
              decoration: InputDecoration(
                  hintText: 'Enter Contact Image Url',
                  labelText: 'Image'
              ),

            ),
            TextButton(
              child: Text('add',style: Theme.of(context).textTheme.button,),
              onPressed: ()async{
                await DbHelper.instance.addcontact(ContactModel(
                name: name.text, number: int.parse(name.text), imageurl: image.text));
                SnackBar(
                  content: Text('Contact added successfully'),
                  duration: Duration(seconds: 2),
                );
                Navigator.of(context).pop();
                  }
              ),
            
              


          ],
        ),
      ),

    );



  }
}
/**/