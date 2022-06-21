
import 'package:flutter/material.dart';
import 'package:sokh/product_categories/custom_circle_container.dart';
import 'package:sokh/product_categories/product_category_pic_and_name.dart';


class ProductCategories extends StatefulWidget {
  const ProductCategories({Key? key}) : super(key: key);

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

  ProductCatPicAndName  productCatPicAndName=ProductCatPicAndName();
  // int i=0;


class _ProductCategoriesState extends State<ProductCategories> {
  @override
  Widget build(BuildContext context) {

    double dynamicHeight =MediaQuery.of(context).size.height;
    double dynamicWidth =MediaQuery.of(context).size.width;


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        color: Colors.white38,
        shadowColor: Colors.black,
        shape: BoxShape.circle,
        elevation: 20,
        child: Stack(
         // alignment: AlignmentDirectional.topStart,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                       for(int i=0;i<=4;i++)
                    CustomCircleContainer(productPic: productCatPicAndName.productPic[i],
                      productDescription: productCatPicAndName.productDescription[i],
                      //index: i,
                    ),
                    Spacer(),

                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    for(int i=5;i<=7;i++)
                      CustomCircleContainer(productPic: productCatPicAndName.productPic[i],
                        productDescription: productCatPicAndName.productDescription[i],
                        //index: i,
                      ),
                    Spacer(),

                  ],
                ),
              ],
            )






          ],
        ),
      ),
    );
  }
}

