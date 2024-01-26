# weatherapp

Flutter app that show the weather condition for your location or you can select another location to get it's weather condition

## About Project

This project structure is MVVM

project layers are data,domain,presentation,utils

data contains the data layers which is remote and local

domain contains the viewModel(Providers Classes) , data models which carry the api response
di, and repository where it switch the data layers and get the data

presentation contains the ui components and screens

utils contains constants and helper methods

Theme contains the dark and light themes

## AppFeatures
Flavors: [dev,staging,production]

AppIcon changes depend on flavor

Theme switch between dark and light

Cashing the data for offline access

request the data from network using Dio

error Handling for network layer and local layer

Di for injection and singleton

unit test for api call

state management using provider

GeoLocating for getting the user location and get weather for his city

all cities are stored in local json file change location by pressing on location icon in home

multithreading for heavy tasks
