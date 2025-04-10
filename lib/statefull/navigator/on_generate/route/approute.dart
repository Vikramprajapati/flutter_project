
import 'package:flutter/material.dart';

import 'package:flutter_practical/statefull/navigator/on_generate/firstroute.dart';
import 'package:flutter_practical/statefull/navigator/on_generate/secondroute.dart';
import 'package:flutter_practical/statefull/navigator/on_generate/thirdroute.dart';

import '../model/employee.dart';



class AppRoute{
  static const firstRoute = '/';
  static const secondRoute = '/second';
  static const thirdRoute = '/third';

  static Route<dynamic>? generateRoute(RouteSettings settings){

    Object? args =settings.arguments;

    switch(settings.name)
        {
      case firstRoute:
       return  MaterialPageRoute(builder:(context) => FirstRoute(),);

      case secondRoute:
        Employee? e=args as Employee;
        return MaterialPageRoute(builder: (context) => SecondRoute(e),);

      case thirdRoute:
        Employee? e=args as Employee;
        return MaterialPageRoute(builder: (context) => ThirdRoute(e),);
    }


  }


}