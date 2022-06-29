import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokh/drawer/drawer_structure.dart';
import 'package:sokh/product_categories/product_categories.dart';
import 'package:sokh/provider/my_home_page_provider.dart';
import '../bottom_navigation_search_page.dart';
import '../flash_sale/flash_sale.dart';
import '../image_slider/image_slider.dart';




List<IconData>iconList=[
  Icons.home,
  Icons.category_rounded,
  Icons.chat_bubble_rounded,
  Icons.account_circle_rounded,
];
var _bottomNavIndex = 0;




class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

    String appTitle='শখ';

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    Provider.of<MyHomePageProvider>(context,listen: false).initializemyHomePageModelClass();

    double dynamicHeight =MediaQuery.of(context).size.height;
    double dynamicWidth =MediaQuery.of(context).size.width;




    return Scaffold(


      drawer: CustomAppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(appTitle,style: TextStyle(
            fontSize: 40
          ),),
        ),
        backgroundColor: Colors.teal.shade400,

      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.black,
        child: Icon(Icons.search_rounded,size: 35,),
        onPressed: () {
          setState(() {
            BottomNavigationSearch();
          });
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.teal,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => setState(() =>
        _bottomNavIndex = index),
      ),

      body: SingleChildScrollView(
        child: Consumer<MyHomePageProvider>(builder: (context,myHomePageProvider,index){
          return  Column(
            children: [


              ImageSlider(
                 // context: context,
                  myHomePageProvider: myHomePageProvider),

              ProductCategories(context: context, homePageProvider: myHomePageProvider,),


              FlashSale(),

            ],
          );

        })

      ),


    );
  }
}


