

class DogModelClass{
  String ? id;
  String ? bread;
  List<String> ? colors;
  String ? age;
  double ? price;
  String ? imgUrl;////////////////////////////////////////////////////////////////

  DogModelClass(this.id, this.bread, this.colors, this.age,this.price);
}


final List<DogModelClass> dogs= [
  DogModelClass('dg1','german shepherd' , ['brown','black'], '3 years', 100),
  DogModelClass('dg2','bull dog' , ['white','black','brown'], '2 years', 100),
  DogModelClass('dg3','labrador' , ['white','brown'], '5 years', 100),
  DogModelClass('dg4','golden retriever' , ['white','brown'], '1 year', 100),
  DogModelClass('dg1','siberian huskey' , ['white','black'], '5 months', 100),
];