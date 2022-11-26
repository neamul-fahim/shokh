
 import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {

  List<String>featuredProduct=[
    'assets/car_pics/car1.jpg',
    'assets/car_pics/car2.jpg',
    'assets/car_pics/car3.jpg',
    'assets/car_pics/car4.jpg',
    'assets/car_pics/car5.jpg',
    'assets/car_pics/car6.jpg',
    'assets/car_pics/car7.jpg',
    'assets/car_pics/car8.jpg',
    'assets/car_pics/car9.jpg',
    'assets/car_pics/car10.jpg',];

  @override
  Widget build(BuildContext context) {

    double dynamicHeight =MediaQuery.of(context).size.height;
    double dynamicWidth =MediaQuery.of(context).size.width;

    return Container(
      height:dynamicHeight*0.5,
       decoration: BoxDecoration(

       ),
      child: Expanded(
        child: GridView.count(
          primary: false,
          physics:NeverScrollableScrollPhysics() ,
          crossAxisCount:2,
          //padding:EdgeInsets.only(top: 80,left: 20,right: 20) ,
          //crossAxisSpacing: 2,
           // mainAxisSpacing: 2,


                children: [
                  for(int i=0;i<featuredProduct.length;i++)
                  Card(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ) ,
                      child: Image.asset(featuredProduct[i],fit: BoxFit.contain,)
                  ),

          ],
        ),
      ),
    );
  }
}
