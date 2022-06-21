import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sokh/image_slider/imaes_of_image_slider.dart';



class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

    ImagesOfImageSlider imagesOfImageSlider=ImagesOfImageSlider();



class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {

    double dynamicHeight =MediaQuery.of(context).size.height;
    double dynamicWidth =MediaQuery.of(context).size.width;



    return Container(
        height:dynamicHeight*0.4,
        width: dynamicWidth,
        decoration: BoxDecoration(
         // color: Colors.teal
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlayInterval: Duration(seconds: 2),
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            autoPlay: true,
          ),
          items: imagesOfImageSlider.productPic.map((index)=>PhysicalModel(

            color: Colors.black,
            shadowColor: Colors.teal,
            elevation: 50,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(border: Border.all(width:0.1, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                //color: Colors.red,
                  image: DecorationImage(
                  image: AssetImage(index),
                    fit: BoxFit.cover,
              )
              ),

            ),
          )
          ).toList(),
        ),


    );
  }
}

