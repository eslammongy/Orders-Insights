
# Flutter Orders Insights App

This project is a Flutter application designed to display insightful metrics and visualizations based on an e-commerce dataset. The app supports **iOS**, **Android**, and **Web** platforms, providing a user-friendly interface for exploring order data.

---

## Features

1. **Screen 1: Numeric Metrics**
    - Total number of orders.
    - Average price of orders.
    - Count of returned orders.

2. **Screen 2: Graph Visualization**
    - A graph representing the number of orders over time, with:
        - **Y-axis**: Number of orders.
        - **X-axis**: Time.

3. **Cool Design** *(Bonus)*:
    - Inspired by modern FinTech design trends for a clean and professional look.

---

## How to Run the Project
  - You can check the release section for the app versions.
  - Also can use this link https://orders-insights.web.app to view on web

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/flutter-ecommerce-insights.git
   cd flutter-ecommerce-insights
   ```

2. **Install Dependencies**
   Ensure you have Flutter installed on your machine. Install required packages:
   ```bash
   flutter pub get
   ```

3. **Run the App**
   To run on a specific platform:
    - **Android/iOS**: Connect your device/emulator and execute:
      ```bash
      flutter run
      ```
    - **Web**: Run the following command:
      ```bash
      flutter run -d web
      ```
---

## Dataset

The app uses a static dataset (`orders.json`) provided in the `assets/` folder. This file contains simulated order data, parsed and analyzed within the app.

---

## Dependencies

- **flutter_chart**: For graph visualization.
- **json_serializable**: To parse the JSON dataset.
- **provider**: For state management.
- **syncfusion_flutter_charts**: For graph visualization.
- **flutter_bloc**: For state management.
- **get_it**: For dependency injection.
- **equatable**: For state comparison.
- **intl**: For datetime formatting.
- **dartz**: For functional programming.
- **dropdown_button2**: For dropdown menus.
- **provider**: For state management.

---

**Screen Recording**
    - A walkthrough of the app running on **iOS, Android, and Web** is you can check these  `recordings`.


