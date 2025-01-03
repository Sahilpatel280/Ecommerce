import 'dart:convert';

import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../models/profiles/profile_model.dart';

import 'package:http/http.dart' as http;
class UpdateProfile extends StatefulWidget {
  final User? user;
   UpdateProfile({super.key,  required this.user});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController  = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    nameController = TextEditingController(text: widget.user?.name);
    userNameController = TextEditingController(text: widget.user?.userName);
    idController = TextEditingController(text: widget.user?.id.toString());
    emailController = TextEditingController(text: widget.user?.email);
    phoneController = TextEditingController(text: widget.user?.phone);
    addressController = TextEditingController(text: widget.user?.address);
    super.initState();
  }

  Future<void> _updateProfile() async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("access_token");

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    
    final body = json.encode({

      'name': nameController.text,
      'userName ':userNameController.text,
      'id':  idController.text,
      'email' :  emailController.text,
      'phone': phoneController.text,
      'address':addressController.text,
    });

    final response = await http.put(
      Uri.parse('https://degmarkservice.hirenow.co.in/api/user-update-profile'),
      headers: headers,
      body: body,
    );
    if(response.statusCode == 200){
      Navigator.pop(context, true);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile.")),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) => value!.isEmpty ? "Enter the Name " : null,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) => value!.isEmpty ? "Enter the UserName " : null,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) => value!.isEmpty ? "Enter the ID " : null,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller:  emailController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) => value!.isEmpty ? "Enter the Email " : null,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller:phoneController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) => value!.isEmpty ? "Enter the PhoneNumber " : null,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) => value!.isEmpty ? "Enter the Address " : null,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems,),
        
                    ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _updateProfile();
                      }
                    }, child: Text("Save"))
        
                  ],
                )
            ),
        ),
      ),
    );
  }
}
