# deriv_price_tracker

A flutter app that show realtime market price from [deriv](https://deriv.com/) api service.

### App Architecture summary
- Used clean architecture for structuring the app.
- There are three layers in the app

    * Application/Feature layer (where user interacts, app UI and widget, where bloc resides and handles business logic)
    * Domain layer (where generate business value, aggregate data from data layer and provide data to business layer.
    * Data layer (where raw data is generated from various sources like remote and local sources.

Followed separation of concerns in terms of organizing the code.
Separation of concern brings below benefits:

    - Ease of refactoring
    - Ease of testing
    - Reusability of code

The first two layers reside in the main app. For the other two layers, two separate packages have been created for.

     ```
     1. main app - Application/Feature layer
     2. price_tracker_repository - Domain layer
     3  price_tracker_api -Domain layer (this an interface, this will implement by the concrete api servie like `derive_api`
     3. deriv_api  - Data Layer 
     ```
                                                                                                                                                  
                                                                                                                                                  
### Installation

If you're new to Flutter the first thing you'll need is to follow the [setup instructions](https://flutter.dev/docs/get-started/install). 

Once Flutter is setup, you can use the latest `stable` channel:
 * Run `flutter channel stable`
 * Run `flutter upgrade`

Once you're on `master` branch, you're ready to run the app:
* `flutter run -d android`
* `flutter run -d ios`
* `flutter run -d web`                                                                                                                                              

### API Key
This repo includes an api id for fetching data from [deriv](deriv.com) service. In order to run the app generate an api on your own and replace in `.env` file.

### License

This application is released under the [MIT license](LICENSE.md). You can use the code for any purpose, including commercial projects.

[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
