import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';

import '../../../domain/models/cities/cities_model.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  List<CityData> cities = [];

  @override
  Widget build(BuildContext ctx) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.0,
            title: const Text("Search Locations"),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.grey.shade400),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            offset: const Offset(0, 0),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Search"),
                        onChanged: (value) {
                          cities.clear();
                          for (var element in provider.citiesModel!.data!) {
                            if (element.name!
                                .toLowerCase()
                                .contains(value.toLowerCase())) {
                              cities.add(element);
                            }
                          }
                          setState(() {});
                        },
                      ),
                    )),
                provider.loadingWeather
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : cities.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Search is Empty"),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: cities.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      provider.location =
                                          "${cities[index].name ?? ""},${cities[index].country ?? ''}";
                                      await provider.getWeatherData(
                                          context, true);
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 5.0),
                                      child: Text(
                                        cities[index].name!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
