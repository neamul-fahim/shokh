
import 'package:flutter/material.dart';
import 'package:sokh/product_categories/custom_circle_container.dart';
import 'package:sokh/product_categories/product_category_pic_and_name.dart';
import 'package:sokh/provider/my_home_page_provider.dart';


class ProductCategories extends StatefulWidget {


  BuildContext context;
  MyHomePageProvider homePageProvider;
   ProductCategories({Key? key,
    required this.context,
    required this.homePageProvider,


  }) : super(key: key);

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
      padding: const EdgeInsets.only(top:8.0,left: 2,right: 2),
      child: Container(
        decoration: BoxDecoration(
          //color:Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              height: dynamicHeight*0.12,
              //width: dynamicWidth,
              decoration: BoxDecoration(
                color:Colors.teal,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhysicalModel(
              color: Colors.grey.shade200,
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
                          CustomCircleContainer(productPic:
                          widget.homePageProvider.myHomePageModelClass.productCategoryPicAndDescription![i].categoryPic.toString(),
                            productDescription:
                            widget.homePageProvider.myHomePageModelClass.productCategoryPicAndDescription![i].categoryDescription.toString(),
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
            ),
        ]
        ),
      ),
    );
  }
}

