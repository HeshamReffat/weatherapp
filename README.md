# weatherapp

Flutter app that show the weather condition for your location or you can select another location to
get it's weather condition

## ConfigureProject

As we have flavors we need to configure the project for running

## Example configuration android studio:

-Search for Edit configurations add new flutter configuration

-Name----> put the name you want (production)

-EntryPoint-----> choose the main_production from project/lib

-Build flavor------> production

-And do that for all the flavors

## Example configuration vscode:

-You have to edit your launch.json file

```
{
            "name": "production", // you can add nickname for it
            "request": "launch",
            "type": "dart",
            "args": [
                "--production", //flavor name
                "prod",
                "-t", // if your have different main file
                "lib/main_production.dart" 
            ]
},
```

## About Project

-This project structure is MVVM

-Project layers are data,domain,presentation,utils

-Data contains the data layers which is remote and local

-Domain contains the viewModel(Providers Classes) , data models which carry the api response
di, and repository where it switch the data layers and get the data

-Presentation contains the ui components and screens

-Utils contains constants and helper methods

-Theme contains the dark and light themes

## AppFeatures

-Flavors: [dev,staging,production]

-AppIcon changes depend on flavor

-Theme switch between dark and light

-Cashing the data for offline access

-Request the data from network using Dio

-Error Handling for network layer and local layer

-Di for injection and singleton

-Unit test for api call

-State management using provider

-GeoLocating for getting the user location and get weather for his city

-All cities are stored in local json file change location by pressing on location icon in home

-Multithreading for heavy tasks
