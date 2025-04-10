import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count=0;

  // get value of count
getCount(){
return _count;
}

void increase()
{
  _count++;
  notifyListeners();
}
  void decrease()
  {
    _count--;
    notifyListeners();
  }

}
