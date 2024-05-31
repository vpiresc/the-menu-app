# About the The Menu App #

![](https://github.com/vpiresc/the-menu-app/blob/main/Images/high_level_design.png)

It is a Server Driven UI study app. It's developed with Swift native language and the server is node.js.

*The Menu App* demonstrates how to build your interface with backend input through a menu dishes and promotions app.


## Technical Details
- The project follows the clean architecture, so It is organized into `Domain`, `Data`, and `Presentation` layers. The app is built using Swift and SwiftUI for the views, following the `Model-View-ViewModel`(MVVM) design pattern. This architectural choice enhances separation of concerns and facilitates testability. 

- Various design patterns such as `Repository`, `UseCases`, and `Factories` are also utilized. These patterns help in organizing code logic and promoting reusability.

- The `async-await` pattern is used to handle errors with `throws`, allowing for asynchronous error handling in a more readable and maintainable way.

- By implementing these technologies and patterns, the project aims to achieve a clean, scalable, and maintainable codebase.


## Build Settings
- Xcode: 15.4
- iOS Deployment Target: 17.4


## Installation
To run the The Menu App locally, follow these steps:

1. Clone the repository to your local machine using `git clone`.
2. Open `the-menu-server`
3. Run `node app.js` or `nodemon app.js` in terminal
4. Open the project in Xcode.
5. Select your target device or simulator
6. Open Xcode to build and run the app.

 ⚠️ Before run the app, you must run the menu server. For that, you may use: `node app.js` or `nodemon app.js` in terminal.

That's it! The app should now be running on your device or simulator. If you encounter any issues during installation, let me know.
