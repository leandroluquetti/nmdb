# Nucci Movie Database

Test Application developed using [TMDb API](https://developers.themoviedb.org)

<img src="screenshots/ss01.png?raw=true" width="250"> <img src="screenshots/ss03.png?raw=true" width="250">

## Requirements

 - Xcode 9
 - Swift 4
 - Cocoapods 1.3.1
 - Carthage

## Before Build

Before build the project please run a `pod install` and `carthage update`

## Environment

 - *Mock*: When running the application on this build configuration it does not use the NetworkProvider to connect to the API its simply start mocking all request using local data
 .
The Tests are configured to run *Mock* Build Configuration. 

## Architecture

I used a architecure based in layers that I'm used to it.

 - *View*: The view layer is an object in the application which is showed to the users. A view object know how and where to display its contents on the screen. It will be responsible for all the UI, user gestures recognizers, animations and custom components. They are also the view objects of our controllers.
 - *Controller*: A controller object acts as an intermediary between one or more of the view objects in an application and its managers. Controller objects are a channel through which objects view are notified of changes to the model and vice-versa. The controller layer will also be responsible for the implementation of flow control (UIStoryboradSegue), responsible for validations and events listening (IBActions). It will implement protocols for UI components such as UITableViewDataSource and UITableViewDelegate.
 - *Manager*: This layer is responsible for the control of the entire flow of operations. It communicates directly with Controller and Business and may contain an instance of NSOperationQueue accessed from a Base manager class to control asynchronous operations and easily cancel, pause or make dependences between operations.
 - *Business*: It intends to focus all business rules. Here we create a methods to fetch data from data Providers and threat all business rules and erros that may occur.
 - *Provider*:The Provider is responsible for the abstraction of 3rd libraries and data providers that the application may have. It based on Facade design pattern. Each provider needs a Protocol are will be defined all public functions exposed to business layers. It's necessary because of Unit Tests where prividers will have there values mocked.

## Dependencies

 - *ElasticTransition*: Transition effect for fancy transitions between controllers and easy implementation for gestures.
 - *lottie-ios*: Used to create the initial animation
 - *SwiftLint*: Linter used to maintain coding style and patterns
 - *Kingfisher*: Easy assync image loader and provides cache
 - *SwiftMessages*: Used to provide Error messages in cases when something goes wrong
 - *Reachability*: Internet Concection checker
 
