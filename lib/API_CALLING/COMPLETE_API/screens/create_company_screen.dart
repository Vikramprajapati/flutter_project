import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/COMPLETE_API/model/company.dart';
import 'package:flutter_practical/API_CALLING/COMPLETE_API/services/company_service.dart';

class CreateCompanyScreen extends StatefulWidget {
  Company? company;
  CreateCompanyScreen({super.key,this.company});

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();



  @override
  void initState() {
   if(widget.company!=null){
     _nameController.text=widget.company!.companyName!;
     _phoneController.text=widget.company!.companyNumber!;
     _addressController.text=widget.company!.companyAddress!;
     _nameController.text=widget.company!.companyName!;
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Company"),
        centerTitle: true,
      ),
      body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value!.length == 0) {
                      return "Please enter Company name";
                    }
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter Company Name"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value!.length == 0) {
                      return "Please enter Company address";
                    }
                  },
                  controller: _addressController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter Company Address"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value!.length == 0) {
                      return "Please enter Company phone number";
                    }
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter Company Phone Number"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        //create object of company class

                        Company newCompany = Company(
                            companyLogo: "https://logo.clearbit.com/mapy.cz",
                            companyAddress: _addressController.text.toString(),
                            companyName: _nameController.text.toString(),
                            companyNumber: _phoneController.text.toString());


                        if(widget.company!=null){
                      await CompanyService().updateCompany(newCompany,widget.company!.id!);
                        }else{
                          //called method to store data

                          await CompanyService().createCompany(newCompany);

                        }



                        //
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     content: Text("Company added successfully")));

                        Navigator.pop(context);

                      }
                    },
                    child: Text(widget.company!=null ?"Update":"save"))
              ],
            ),
          )),
    );
  }
}
