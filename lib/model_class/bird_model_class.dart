

class BirdModelClass{
  String ? id;
  String ? bread;
  List<String> ? colors;
  String ? age;
  double ? price;
  String ? imgUrl;//////////////////////////////////////////////////

  BirdModelClass(this.id, this.bread, this.colors, this.age,this.price);
}

final List<BirdModelClass> birds=[
  BirdModelClass('bd1','budgerigar' , ['yellow','green','blue','white','black'], '9 months', 75),
  BirdModelClass('bd2','parrot' , ['green'], '6 months', 75),
  BirdModelClass('bd3','owl' , ['brown','white'], '1 year 2 months', 75),
  BirdModelClass('bd4','blue jay' , ['blue','white','black'], '1 year', 75),
  BirdModelClass('bd5','falcon' , ['brown','white','black'], '2 years', 75),
];