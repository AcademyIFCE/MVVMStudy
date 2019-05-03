# MVVMStudy

<img align="right" srcset="https://user-images.githubusercontent.com/32227073/57115606-47a9b580-6d26-11e9-8d4d-b69892b72bdb.png, https://user-images.githubusercontent.com/32227073/57115606-47a9b580-6d26-11e9-8d4d-b69892b72bdb.png 1.5x, https://user-images.githubusercontent.com/32227073/57115606-47a9b580-6d26-11e9-8d4d-b69892b72bdb.png 2x" src="https://user-images.githubusercontent.com/32227073/57115606-47a9b580-6d26-11e9-8d4d-b69892b72bdb.png" width="150px;" />

This repository is intended to learn and practice a bit about MVVM and Multiple ways to use bindings on the MVVM architecture


The MVVM pattern includes three key parts:

Model <br> 
View <br> 
ViewModel <br>

<br> </br>
<br> </br>


![mvvm](https://user-images.githubusercontent.com/32227073/57115534-de29a700-6d25-11e9-9cc2-2d0f0a413059.png)

## Config
#### Install
1. `Clone project` `git clone https://github.com/AcademyIFCE/MVVMStudy` 
2. Open your Xcode, select a simulator, click the play button or `cmd + R`
3. You can create your branch if you apple developer academy student with `git checkout -b "name-of-your-branch"

#### Project 

![project](https://user-images.githubusercontent.com/32227073/57115300-88083400-6d24-11e9-8d2b-72902946e29d.png)
1. In project we have the folders that have responsible base of project, so don't change in this file, just use this `projects.append( Project(name: "Your Name", destination: YourDestinationController.self) )`
just set your name and your destination controller
2. To create your participation just create the folder with your name, so enjoy to create your architecture of folder
![folder](https://user-images.githubusercontent.com/32227073/57115396-209eb400-6d25-11e9-9c50-88f4fe71c974.png)

##
Bellow you can see more a little bit about MVVM and Binding, you can improve this text editing this Readme.md and create the PR for this


## Modules

In this sample app we have the following modules/layers:

### DependencyInjector
		
Framework responsible for linking the Interfaces to the `Factories`. This should only the referenced/used in the `App Module`.

### Model

Model refers either to a domain model, which represents real state content (an object-oriented approach), or to the data access layer, which represents content (a data-centric approach

### View

As in the model-view-controller (MVC) and model-view-presenter (MVP) patterns, the view is the structure, layout, and appearance of what a user sees on the screen. It displays a representation of the model and receives the user's interaction with the view (clicks, keyboard, gestures, etc.), and it forwards the handling of these to the view model via the data binding (properties, event callbacks, etc.) that is defined to link the view and view model.
### View Model

The view model is an abstraction of the view exposing public properties and commands. Instead of the controller of the MVC pattern, or the presenter of the MVP pattern, MVVM has a binder, which automates communication between the view and its bound properties in the view model. The view model has been described as a state of the data in the model
The main difference between the view model and the Presenter in the MVP pattern, is that the presenter has a reference to a view whereas the view model does not. Instead, a view directly binds to properties on the view model to send and receive updates. To function efficiently, this requires a binding technology or generating boilerplate code to do the binding.
