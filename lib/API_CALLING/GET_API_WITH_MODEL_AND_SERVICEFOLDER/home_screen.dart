import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/GET_API_WITH_MODEL_AND_SERVICEFOLDER/model/users_model.dart';
import 'package:flutter_practical/API_CALLING/GET_API_WITH_MODEL_AND_SERVICEFOLDER/service/api_service.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<Users> usersData=[];

  getUser() async{
    usersData=await ApiService().getUsers();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUser();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Structured API Calling'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUser(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               if(snapshot.connectionState==ConnectionState.waiting){
                 return Center(child: CircularProgressIndicator(),);
               }
               else if(snapshot.hasError){
                 return Center(child: Text("Eroor:${snapshot.error}"),);
               }


               //TODO check later
               // else if (!snapshot.hasData || snapshot.data!.isEmpty) {
               //   return Center(child: Text('No Data Found'));
               // }


               else{
                 return ListView.builder(
                   itemCount: usersData.length,
                   itemBuilder: (context, index) {
                     return Card(
                       child: ListTile(
                         leading: CircleAvatar(
                           child: Text("${index + 1}"),
                         ),
                         title: Text(usersData[index].title.toString()),
                         subtitle: Text(usersData[index].body.toString()),
                       ),
                     );
                   },
                 );
               }
            
              },
            
            ),
          )
        ],
      )
    );
  }
}
