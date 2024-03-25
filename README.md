# News App with RESTful API in Flutter

In this project I created a news app which lets you browse the latest news relating to business in the US using a RESTful API. I utilized the Flutter framwork and the News API to display the latest news and allow the user to navigate to each article accordingly.

## Table of Contents

- [Installation](#installation)
- [Project Structure](#project-structure)
- [Contact](#contact)

## Installation

1. Make sure all Flutter and Dart dependencies are installed on your device.
2. Clone the repository.
3. Navigate to the project directory.
4. Enter 'flutter run' in the terminal to run the application.
5. Choose the desired emulator if any.

## Project Structure

- lib/: Main source code directory
- main.dart: Entry point of the Flutter app.
- consts.dart: Stores constants that will be used throughout the app.
- pages/: Stores the pages used in the Flutter app.
- home_page.dart: The app's main page which loads all the recent news articles and displayes their photos, titles, and publish times.
- models/: Stores the models used in creating the app.
- article.dart: Contains the model for the Article and Source objects which stores: source, author, title, description, url, imageuri, publish time, content. Also, this file stores the defined functions for creating instances of this model using the data retreived from the News API.

This app also utilizes a RESTful API by using:
- HTTP Requests: The app uses the Dio package to make HTTP GET requests to the NewsAPI endpoint.
- API Endpoint and Query Parameters: The API endpoint (https://newsapi.org/v2/top-headlines) is provided, along with query parameters (country=us&category=business&apiKey=$NEWS_API_KEY). These parameters help in specifying the data required from the server.
- Response Handling: After making the request, the app receives a JSON response from the server. It then parses this JSON response to extract relevant data (articles) using Dart's built-in JSON decoding capabilities.
- Data Modeling: The app defines a Article model class to represent the structure of the articles received from the API response.
- State Management: The app uses state management (specifically setState()) to update the UI with the fetched articles.
- UI Integration: The fetched data is seamlessly integrated into the app's UI. Each article is displayed as a ListTile widget, showing relevant information such as the article's title, published date, and an image. Users can tap on an article to open its URL in a web browser, demonstrating interaction with the fetched data.

## Contact

  If you have any questions or feedback, feel free to contact me at karimkamel23@gmail.com
