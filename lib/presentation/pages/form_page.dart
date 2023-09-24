import 'package:flutter/material.dart';
import 'package:frist_project/presentation/pages/pets_page.dart';

class FormPage extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var name=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();

  FormPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                validator: (value) {
                  if (value==null||value!.isEmpty) {
                    return 'name must be entered';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return'email must  be entered';
                  }
                  else if(value.length<5||value.startsWith('@')||!value.contains("@")||!value.endsWith('.com'))
                    return'please enter the email correct';
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),

              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return'password must be enetred';
                  }
                  if(value.length<8){
                    return'password length can not be less than 8';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: (){
                   if(formKey.currentState!.validate()) {
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context)=>PetPage()));
                   }
                  },
                  child: Text('login'))
            ],
          ),
        ),
      ),
    );
  }
}
