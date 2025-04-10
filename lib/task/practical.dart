import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children:[
                Container(
                  height: 250,
                  width: double.infinity,
              
                  child: Image.asset(
                    "assets/images/trial.jpg",
                    fit: BoxFit.cover,
                  )),

                Positioned(
                  top: 30,
                  right: 15,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    
                    child: Icon(Icons.access_time_filled,
                    ),
                  ),
                ),

                Positioned(
                  top: 30,
                  left: 15,
                  child: CircleAvatar(
                    
                    radius: 17,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios_rounded,
                    size: 16,),
                  ),
                ),

                
        ]
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              padding: EdgeInsets.only(left: 25,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Men's Winter Jacket",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$148',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Stay Warm and stylish this winter with our premium Men's Winter Jacket.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,

                    ),
                  ),

                  SizedBox(height: 20,),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/images/Cristiano.jpeg"),
                          ),
                          SizedBox(width: 15,),
                          Text("Alex Morgan",
                            style: TextStyle(

                              fontSize: 22,

                            ),)
                        ],
                      ),

                      SizedBox(height: 10,),
                      Text("I abosolutely love this Jacket! It kept me warm during a recent trip to the  mountains, and the windproof feature really works. ",
                        style: TextStyle(fontSize: 15,
                        color: Colors.grey.shade800),
                      )
                    ],
                  ),


                  SizedBox(height: 20,),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/images/Cristiano.jpeg"),
                          ),
                          SizedBox(width: 15,),
                          Text("Mike Doe",
                            style: TextStyle(

                              fontSize: 22,

                            ),)
                        ],
                      ),

                      SizedBox(height: 10,),
                      Text("I abosolutely love this Jacket! It kept me warm during a recent trip to the  mountains, and the windproof feature really works. ",
                        style: TextStyle(fontSize: 15,
                            color: Colors.grey.shade800),
                      )
                    ],
                  )


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
