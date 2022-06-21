import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sokh/flash_sale/flash_sale_custom_container.dart';


class FlashSale extends StatefulWidget {
  const FlashSale({Key? key}) : super(key: key);

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  @override
  Widget build(BuildContext context) {

    double dynamicHeight =MediaQuery.of(context).size.height;
    double dynamicWidth =MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black12
      ),

           //height: dynamicHeight*0.3,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
         children:  [
           FlashSaleCustomContainer(),
           FlashSaleCustomContainer(),
           FlashSaleCustomContainer(),
           FlashSaleCustomContainer(),

         ],
        ),
      ),
    );
  }
}
