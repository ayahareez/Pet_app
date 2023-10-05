import 'package:flutter/material.dart';
import 'package:frist_project/data/data_source/pets_local_datasource/pets_local_datasource.dart';
import 'package:frist_project/data/data_source/user_local_datasource/user_local_datasource.dart';
import 'package:frist_project/data/models/user_data.dart';
import 'package:frist_project/presentation/pages/page_controller.dart';
import 'package:frist_project/presentation/pages/pets_page.dart';

class FormPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  FormPage({super.key});

  late String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: FutureBuilder(
        future: UserLocalDataImpl().hasSignedUP().then((value) async {
          if (value) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ControllerPage()));
          }
        }),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double width = constraints.maxWidth;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: name,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            labelText: 'name',
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return 'name must be entered';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: email,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'email must  be entered';
                            } else if (value.length < 5 ||
                                value.startsWith('@') ||
                                !value.contains("@") ||
                                !value.endsWith('.com'))
                              return 'please enter the email correct';
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: password,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'password must be enetred';
                            }
                            if (value.length < 8) {
                              return 'password length can not be less than 8';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: width / 2,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                PetsLocalDataImpl().addPetsFirst();
                                UserData userData = UserData(
                                    name: name.text,
                                    email: email.text,
                                    password: password.text);
                                await UserLocalDataImpl().setUser(userData);
                                final signedUp =
                                    await UserLocalDataImpl().hasSignedUP();
                                if (signedUp) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ControllerPage()));
                                }
                                print(signedUp);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple),
                            child: const Text(
                              'login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}