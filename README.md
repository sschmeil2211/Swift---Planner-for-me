# Swift---Planner-for-me

Planner For Me
Build Status

Table of Contents
Description
Project Status
Demo
Scripts Explanation
Access to the Project
Technologies Used
Developers
Description
Planner For Me is a task management application that allows users to add, mark as completed, and delete tasks or commitments. The tasks are stored in Firestore, providing a cloud-based solution for seamless access across devices.

Project Status
The project is complete and fully functional.

Demo
To see the application in action, check out the demo video here.

Scripts Explanation
Models - ToDoListItem
Defines the structure for a to-do list item, including its properties and methods.

Models - User
Defines the structure for a user, including user-related information.

Other-Extensions
Contains an extension to convert an object conforming to the Encodable protocol into a dictionary.

Other - GoogleService-Info.plist
Configuration file containing Firebase settings for the project.

Other - planner_for_meApp
Main application file initializing Firebase and defining the app's entry point.

ViewModels-HomeViewViewModel
ViewModel for managing the HomeView, checking user authentication state.

ViewModels-NewItemViewViewModel
ViewModel for managing the NewItemView, handling the creation and saving of new to-do items.

ViewModels-ProfileViewViewModel
ViewModel for managing the ProfileView, fetching user data from Firestore, and handling sign-out.

ViewModels-SignInViewViewModel
ViewModel for managing the SignInView, handling user sign-in with email and password.

ViewModels-SignUpViewViewModel
ViewModel for managing the SignUpView, handling user registration and inserting user records into Firestore.

ViewModels-ToDoListItemViewViewModel
ViewModel for managing the ToDoListItemView, toggling the "isDone" state of a to-do list item.

ViewModels-ToDoListViewViewModel
ViewModel for managing the ToDoListView, handling the deletion of to-do items.

Views-ButtonView
Reusable SwiftUI component for creating styled buttons.

Views-HeaderView
Reusable SwiftUI component for creating a header with a title, subtitle, and background color.

Views-HomeView
Main view displaying either the ToDoListView or SignInView based on user authentication.

Views-NewItemView
View for creating and saving new to-do items.

Views-ProfileView
View displaying user profile information and allowing the user to sign out.

Views-SignInView
View for user sign-in with email and password.

Views-SignUpView
View for user registration.

Views-ToDoListItemView
View displaying individual to-do list items.

Views-ToDoListView
Main view displaying the user's to-do list and allowing the addition of new items.

Access to the Project
To access and test the project, follow these steps:

Clone the repository.
Open the project in Xcode.
Ensure dependencies are installed.
Build and run the project on a simulator or physical device.
Technologies Used
Swift
Xcode
Firebase
Developers
Sebastian Schmeil
