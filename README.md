# Getaround Mobile Challenge

I propose to create a single view application following the MVP design pattern comprised of a TableView displaying available cars.
A second screen would be presented modally when tapping on a car to present detailed information regarding the car and owner.
The app supports Darkmode.

I m proposing to construct the UI completely in code, with resuable views.
Inline with the challenge guidelines, for time constraints  and reliability I m introducing an SPM to load and cache the webImage using Kingfisher.
Also I m introducing a Star Rating View added manually as not available as SPM.

To instatiante the view controllers and to decouple the creation of ViewController, I m introducing a Factory protocol with a concrete implementation 
by ViewControllerFactory.
The Factory is owned by the SceneDelegate and passed around via initiliser injection.


## LEVEL 1 - fetching and displaying cars

This view is a simple UITableViewController with a custom Cell

I'm introducing the use of DiffableDataSource for this project, I made the dataModel conform to Hashable protocol.

To remove logic from this ViewController, I impleted the MVP design patern.
The presenter owns the avavailableCar array and fetches data from the API, then pass back the data via delegate protocol to the ViewController.

I'm using URLSessiondataTask to fetch the data from the API.

Both Presenter and Network Layer have been tested.


## LEVEL 2 - display a car details

This view displays a custom UIView with the car image, car details, own image and details.
To support all phone sizes, i placed the view elements in a scrollView.

This view il presented modally and can be dismissed by either pushing down or tapping on the close button.

Thank you for your time and the opportunity to complete this challenge.




