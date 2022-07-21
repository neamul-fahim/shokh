//import 'package:first_flutter_p/drawer/drawer_options.dart';
//import 'package:first_flutter_p/my_home_page.dart';
//import 'package:first_flutter_p/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokh/drawer/weather.dart';
import 'package:sokh/my_home_page/my_home_page.dart';

import '../provider/app_drawer_provider.dart';

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}





class _CustomAppDrawerState extends State<CustomAppDrawer> {
  @override
  Widget build(BuildContext context) {

    Provider.of<AppDrawerProvider>(context,listen: false).initializeAppDrawerModelClass();

    double dynamicHeight=MediaQuery.of(context).size.height;
    double dynamicWidth=MediaQuery.of(context).size.width;
    return
      Consumer <AppDrawerProvider>(builder: (context,appDrawerProvider,index)
          {
            return Container(
              height: dynamicHeight,
              width: dynamicWidth*2/3,
              decoration: BoxDecoration(

                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children:[
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(

                      height: dynamicWidth*0.18,
                      width: dynamicWidth*0.18,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(image:
                          AssetImage(appDrawerProvider.appDrawerModelClass.profilePic.toString())
                          )
                      ),
                    ),
                  ),

                  Text(appDrawerProvider.appDrawerModelClass.profileName.toString()),

                  drawerProperty(Icons.home_rounded, 'Home',context,()=>MyHomePage()),
                  drawerProperty(Icons.add_circle, 'Add Post',context,()=>MyHomePage()),
                  drawerProperty(Icons.notifications_active, 'Notification',context,()=>MyHomePage()),
                  drawerProperty(Icons.cloud_rounded, 'Weather',context,()=>Weather()),

                ],
              ),
            );
          }
      );
  }
}


 Container drawerProperty(IconData drawerOptionIcon,String drawerOptionName,BuildContext context,Widget Function() className){
  return Container(
    child:Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return className();
          }));

        },
        child: Row(
          children: [
            Icon(drawerOptionIcon,color: Colors.black,),
            SizedBox(
              width: 10,
            ),
            Text(drawerOptionName,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400

            ),),
          ],
        ),
      ),
    )
  );
}

   // void pageRout(BuildContext context,className){
   // Navigator.push(context, MaterialPageRoute(builder: (context)=>className));
   //
   // }