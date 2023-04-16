
class CatModelClass{
  String ? id;
  String ? bread;
  List<String> ? colors;
  String ? age;
  double ? price;
  String ? imgUrl;/////////////////////////////////////////////////////////
  CatModelClass(this.id, this.bread, this.colors, this.age,this.price);
}

 final List<CatModelClass> cats= [
   CatModelClass('ct1', 'siamese',['white','black'] , '1 year',100),
   CatModelClass('ct2', 'british shorthair',['ash'] , '2 years',100),
   CatModelClass('ct3', 'maine coon',['brown','black'] , '1 year',100),
   CatModelClass('ct4', 'persian',['brown','white'] , '7 months',100),
   CatModelClass('ct5', 'ragdoll',['white','black'] , '2 years 5 months',100),
 ];