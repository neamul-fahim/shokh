

import 'package:flutter/cupertino.dart';
import 'package:sokh/model_class/my_home_page_model_class.dart';
import 'package:sokh/repository/my_home_page_repository.dart';

class MyHomePageProvider with ChangeNotifier{
  MyHomePageRepository myHomePageRepository=MyHomePageRepository();
  MyHomePageModelClass _myHomePageModelClass=MyHomePageModelClass();

  MyHomePageModelClass get myHomePageModelClass => _myHomePageModelClass;

  initializemyHomePageModelClass(){
    _myHomePageModelClass=myHomePageRepository.myHomePageModelClass;
    notifyListeners();

  }
}