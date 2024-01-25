import 'package:flutter/material.dart';
import 'package:weatherapp/presentation/screens/next-days/components/app_bar.dart';
import 'components/bottom_list.dart';
import 'components/center_card.dart';
import 'components/days_list.dart';

class NextDays extends StatelessWidget {

  const NextDays({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 1,
                child: Container(
                  height: size.height / 1.8,
                  width: size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        Color(0xff6ac5fe),
                        Color(0xff45b6fe),
                        Color(0xff45b6fe),
                        // Colors.blue
                      ])),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      DaysCustomAppBar(),
                      SizedBox(
                        height: 20,
                      ),
                      DaysList(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                child: Container(
                  height: size.height / 1.9,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
              BottomList(),
              const Hero(
                tag: 'TAG',
                child: Material(color: Colors.transparent, child: CenterCard()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
