## Comprehensive README for the E-commerce App

### Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Setup Instructions](#setup-instructions)
4. [Usage](#usage)
5. [File Descriptions](#file-descriptions)
6. [API Integration](#api-integration)
7. [Dependencies](#dependencies)
8. [Troubleshooting](#troubleshooting)

### Introduction
This E-commerce app is built using Flutter and GetX for state management. It allows users to browse through a list of products, view product details, and add products to their cart.

### Project Structure
The project is organized as follows:
```
lib
├── components
│   ├── add_to_cart_icon.dart
│   ├── grid_layout.dart
│   ├── loader.dart
│   ├── my_app_bar.dart
│   └── product_card.dart
├── controllers
│   └── product.controller.dart
├── data
├── models
│   └── product.model.dart
├── repositories
│   └── product_repository.dart
├── util
│   ├── constants
│   │   ├── colors.dart
│   │   └── sizes.dart
│   ├── helpers
│   │   ├── helper_functions.dart
│   │   ├── my_loader.dart
│   │   └── network_manager.dart
│   └── themes
├── viewmodels
├── views
│   ├── home_page.dart
│   └── single_product.dart
└── main.dart
```

### Setup Instructions
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/King-AJr/timbu_products_app
   ```
2. **Navigate to the Project Directory:**
   ```sh
   cd timbu_product_app
   ```
3. **Install Dependencies:**
   ```sh
   flutter pub get
   ```
4. **Set Up Environment Variables:**
   - Create a `.env` file in the root of the project.
   - Add your API URL:
     ```
     API_URL=https://timbu_api_endpoint
     ```

5. **Run the App:**
   ```sh
   flutter run
   ```

### Usage
- Launch the app on an emulator or physical device.
- Browse through the products displayed on the home page.
- Tap on a product to view its details.

### File Descriptions

#### Main File
- **`main.dart`**: Entry point of the application. It sets up the necessary bindings and initializes the app.

#### Models
- **`product.model.dart`**: Defines the `ProductModel` class which represents a product.

#### Repositories
- **`product_repository.dart`**: Handles API requests to fetch product data.

#### Controllers
- **`product.controller.dart`**: Manages the state of the product list and handles logic for fetching products from the repository.

#### Views
- **`home_page.dart`**: Displays a list of products using a `GridLayout`.
- **`single_product.dart`**: Shows detailed information about a selected product.

#### Components
- **`add_to_cart_icon.dart`**: Custom widget for the add-to-cart icon.
- **`grid_layout.dart`**: Layout component for displaying products in a grid.
- **`loader.dart`**: Loading indicator widget.
- **`my_app_bar.dart`**: Custom AppBar widget.
- **`product_card.dart`**: Widget for displaying product information in a card format.

#### Utilities
- **`colors.dart`**: Defines the color constants used in the app.
- **`sizes.dart`**: Defines size constants.
- **`helper_functions.dart`**: Helper functions used throughout the app.
- **`my_loader.dart`**: Helper for displaying loading indicators and snackbars.
- **`network_manager.dart`**: Utility for checking network connectivity.

### API Integration
The app fetches product data from an organisation in [timbu.cloud](https://timbu.cloud/) The `ProductRepository` handles the HTTP requests and returns a list of `ProductModel` objects.

#### Fetching Products
- **Endpoint**: The API URL is stored in the `.env` file.
- **Request**: A GET request is sent to the API to fetch the product data.
- **Response Handling**: The response is parsed, and the product data is converted into a list of `ProductModel` objects.

### Dependencies
- **Flutter**: The main framework for building the app.
- **GetX**: For state management and dependency injection.
- **flutter_dotenv**: For managing environment variables.
- **http**: For making HTTP requests.
- **cached_network_image**: For efficient image loading and caching.
- **connectivity_plus**: For checking network connectivity.
- **flutter_spinkit**: For loading indicators.
- **iconsax**: For icons used in the app.

### Troubleshooting
1. **API Errors**: Ensure that the API URL is correct and the server is running.
2. **Network Issues**: Check your internet connection and make sure the device/emulator is connected.
3. **Dependencies**: Run `flutter pub get` to ensure all dependencies are installed.

### Example Usage of the Controller and Navigation

[Here's](https://appetize.io/app/b_w7rjmie43jibdil75uodyqwjju?device=pixel7&osVersion=13.0) a simulator environment you can test the app on. You can also download the app [here](https://fastupload.io/397205828b8b1dea).
