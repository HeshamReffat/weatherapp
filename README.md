# weatherapp

A Flutter Task.

## Getting Started

This project structure is MVVM

project layers are data,domain,presentation,utils

data contains the data layers which is remote and local

domain contains the viewModel(Providers Classes) , data models which carry the api response
di, and repository where it switch the data layers and get the data

presentation contains the ui components and screens

utils contains constants and helper methods

## appFeatures

Cashing the data for offline access
request the data from network using Dio
error Handling for network layer and local layer
unit test for api calls
state management using provider
