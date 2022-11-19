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

    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        decoration: BoxDecoration(

          color: Colors.white10,
        ),

             //height: dynamicHeight*0.3,
        child: Column(
          children: [
            /// "FLASH SALE"  and "MORE"  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            Row(
              children: [
                Spacer(flex: 1),
                Text("FLASH SALE!!!!",
                  style: TextStyle(color:Colors.red.shade900,fontSize:30 ,fontWeight:FontWeight.w600,wordSpacing: 5 ),),
               Spacer(flex: 5),

                InkWell(
                  onTap: (){

                  },
                    child: Text("More>",
                      style: TextStyle(color:Colors.black,fontSize:18 ,fontWeight:FontWeight.w400,wordSpacing: 5 ),)),
                Spacer(flex: 1),
              ],
            ),
            /// "FLASH SALE"  and "MORE"  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


            ///Product pic,description,price etc SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Container(
                color: Colors.white12,
                child: Row(
                 children:  [
                   FlashSaleCustomContainer(),
                   FlashSaleCustomContainer(),
                   FlashSaleCustomContainer(),
                   FlashSaleCustomContainer(),

                 ],
                ),
              ),
            ),

            ///Product pic,description,price etc EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

          ],
        ),
      ),
    );
  }
}
