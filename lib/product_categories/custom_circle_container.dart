import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomCircleContainer extends StatefulWidget {
  String productPic;
  String productDescription;
  // int index;


   CustomCircleContainer({Key? key,
    required this.productPic,
   required this.productDescription,
    // required this.index,
  }) : super(key: key);

  @override
  State<CustomCircleContainer> createState() => _CustomCircleContainerState();
}

class _CustomCircleContainerState extends State<CustomCircleContainer> {
  @override
  Widget build(BuildContext context) {
    double dynamicHeight =MediaQuery.of(context).size.height;
    double dynamicWidth =MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          PhysicalModel(
            color: Colors.black,
            shadowColor: Colors.teal,
            elevation: 20,
            shape: BoxShape.circle,
           // borderRadius: BorderRadius.circular(180),

            child: Container(

              height: dynamicWidth*0.12,
              width: dynamicWidth*0.15,
              decoration: BoxDecoration(
                border: Border.all(width:0.1, color: Colors.black),
                borderRadius: BorderRadius.circular(180),
                    color: Colors.teal.shade200,
                image: DecorationImage(
                  image: AssetImage(widget.productPic),
                  fit: BoxFit.cover
                )
              ),

            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(widget.productDescription,
              //overflow: TextOverflow.ellipsis,
              //textScaleFactor: ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
              fontSize: 10
            ),),
          )

        ],
      ),
    );
  }
}
