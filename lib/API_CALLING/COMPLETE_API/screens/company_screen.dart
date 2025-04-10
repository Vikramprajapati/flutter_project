import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/COMPLETE_API/model/company.dart';
import 'package:flutter_practical/API_CALLING/COMPLETE_API/screens/create_company_screen.dart';
import 'package:flutter_practical/API_CALLING/COMPLETE_API/services/company_service.dart';

class CompanyScreen extends StatefulWidget {
  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  List<Company> companyData = [];

  getData() async {
    companyData = await CompanyService().getAllCompanies();
    return companyData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Eroor:${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: companyData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                companyData[index].companyLogo.toString()),
                          ),
                          title:
                              Text(companyData[index].companyName.toString()),
                          subtitle: Text(
                              companyData[index].companyAddress.toString()),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "update") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreateCompanyScreen(
                                        company: companyData[index],
                                      ),
                                    ));
                              }

                              //TODO code for delete company

                              if (value == "delete") {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        "Are you  want to delete this Company?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("CANCEL")),
                                      TextButton(
                                          onPressed: () async {
                                            await CompanyService()
                                                .deleteCompany(
                                                    companyData[index].id!);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Company deleted successfully")));
                                            Navigator.pop(context);

                                            setState(() {});
                                          },
                                          child: Text("YES"))
                                    ],
                                  ),
                                );
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  value: "update",
                                  child: Row(
                                    children: [
                                      Icon(Icons.update),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Update")
                                    ],
                                  )),
                              PopupMenuItem(
                                value: "delete",
                                child: Row(
                                  children: [
                                    Icon(Icons.delete),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Delete")
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("No Data Found"),
                );
              }
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateCompanyScreen(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
