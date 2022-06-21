import 'package:flutter/material.dart';
import 'package:sokh/flash_sale/flash_sale_product_pic_and_description.dart';


class FlashSaleCustomContainer extends StatefulWidget {
  const FlashSaleCustomContainer({Key? key}) : super(key: key);

  @override
  State<FlashSaleCustomContainer> createState() => _FlashSaleCustomContainerState();
}

  double price = 100;
   FlashSaleProductPicAndDescription flashSaleProductPicAndDescription=FlashSaleProductPicAndDescription();



class _FlashSaleCustomContainerState extends State<FlashSaleCustomContainer> {
  @override
  Widget build(BuildContext context) {


    double dynamicHeight =MediaQuery.of(context).size.height;
    double dynamicWidth =MediaQuery.of(context).size.width;



    return Container(
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.all(10.0),
            child: Container(
              height: dynamicHeight*0.4,
             width: dynamicWidth*0.4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
                image:  DecorationImage(
                  image: AssetImage(flashSaleProductPicAndDescription.productPic[0]),
                  fit: BoxFit.cover

                )
              ),
            ),
          ),


          // Container(
          //   child: RichText (
          //     text: TextSpan(
          //       text: 'product description',
          //       children: [
          //         TextSpan(
          //           text:price.toString(),
          //         )
          //       ]
          //     ),
          //   ),
          //
          // ),


        ],
      ),
    );
  }
}
