import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';
class BottomList extends StatelessWidget {
   BottomList({super.key});
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Consumer<WeatherProvider>(builder: (BuildContext context, WeatherProvider provider, Widget? child) {
      return Positioned(
        bottom: 1,
        child: SizedBox(
          height: size.height/2,
          width: size.width,
          child: ListView.builder(
            itemCount: provider.weatherDataModel!.days!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: EdgeInsets.only(left: 20,right: 20,top: index==0 ? 230: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  height: 100,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(provider.getDate(index),
                        style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: provider.getMinTemp(index),
                              style: TextStyle(color: Colors.grey.withOpacity(.5),fontWeight: FontWeight.bold,fontSize: 30),
                            ),
                            TextSpan(text: '/',
                              style: TextStyle(color:Colors.grey.withOpacity(.5),fontWeight: FontWeight.bold,fontSize: 25),
                            ),
                            TextSpan(text: provider.getMaxTemp(index),
                              style: TextStyle(color: Colors.grey.withOpacity(.5),fontWeight: FontWeight.bold,fontSize: 20),
                            ),

                          ]
                      ),
                      ),
                      Image.asset(
                        provider.getImage(index),
                        height: 70,
                        width: 70,

                      )

                    ],
                  ),
                ),
              );
            },),
        ),
      );
    },
    );
  }
}
