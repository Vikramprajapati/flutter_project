import 'package:get/get.dart';

class CounterContoller extends GetxController{

  var count=0.obs;

  increase(){
    count++;
  }

  decrease()
  {
    count--;
  }

}