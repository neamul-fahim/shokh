
import 'package:flutter/material.dart';




class ModelClass{
  List<String>? name;
   List<Model1>? ModelList;

  ModelClass({this.name, this.ModelList});

  ModelClass modelClass=ModelClass(name: ['fahim','fahim','fahim','fahim',],
    ModelList: [
      Model1([1,2,3,4]),
    ]
  );
}


class Model1{
  List<int>?roll;

  Model1(this.roll);
}