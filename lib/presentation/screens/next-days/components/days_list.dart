import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';
class DaysList extends StatelessWidget {
   const DaysList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<WeatherProvider>(builder: (BuildContext context, WeatherProvider provider, Widget? child) {
      return SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provider.weatherDataModel!.days!.length,
          itemBuilder: (context, index) {
            return  GestureDetector(
              onTap: () => provider.setDay(index),
              child: Container(
                width: 70,
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: provider.currentDay==index  ? Colors.white : Colors.white12 ,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        provider.getImage(index),
                      ),
                    ),
                    Text(
                      provider.getMonth(index),
                      style: TextStyle(color:
                      provider.currentDay==index ? Colors.purple : Colors.white,fontSize: 30,height: 0,fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      provider.getMonthDay(index),
                      style: TextStyle(color:
                      provider.currentDay==index ? Colors.purple : Colors.white,fontSize: 15,height: 0,fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            );
          },),
      );
    },
    );
  }
}
