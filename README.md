# Flutter Image Gallery App

This is a Flutter application that displays a gallery of images fetched from the Pixabay API. The images are displayed in a grid layout, and each image shows the number of likes and views it has received. The gallery dynamically adjusts the number of columns based on the screen size.

## Features
- Fetches images from Pixabay API.
- Responsive grid layout: adjusts the number of columns based on screen width.
- Displays image likes and views.
- Tap on any image to trigger a callback.

## Tech Stack
- **Flutter**: Frontend framework.
- **Dart**: Programming language.
- **GetX**: For state management.
- **Pixabay API**: For image data.
- **MasonryGridView**: For staggered grid layout.

## Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 2.10.0 or later)
- [Pixabay API Key](https://pixabay.com/api/docs/)

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/flutter-image-gallery.git
    cd flutter-image-gallery
    ```

2. **Install dependencies:**

   Run the following command in the project root to install the necessary packages:

    ```bash
    flutter pub get
    ```

3. **Pixabay API Key:**

   Get your Pixabay API key from [Pixabay API](https://pixabay.com/api/docs/), and replace the placeholder key in `GalleryController.dart` with your key.

4. **Run the app:**

   For mobile (iOS or Android):

    ```bash
    flutter run
    ```

   For web:

    ```bash
    flutter run -d chrome
    ```

5. **Deploying to GitHub Pages:**

   Follow these steps to deploy the web version of the app to GitHub Pages:

    1. Install `webdev`:
        ```bash
        flutter pub global activate webdev
        ```

    2. Build for the web:
        ```bash
        flutter build web
        ```

    3. Commit and push the build:
        ```bash
        git add .
        git commit -m "Deployed web version"
        git push origin main
        ```

    4. Go to GitHub > Settings > Pages > Set source as `/docs`.

## Project Structure

```bash
lib/
│
├── models/
│   └── image_model.dart      # Data model for Pixabay image
│
├── controllers/
│   └── gallery_controller.dart   # GetX controller for managing state and API calls
│
├── pages/
│   ├── gallery_page.dart     # Displays grid of images
│   └── detail_page.dart      # Displays details of a selected image
│
├── router/
│   ├── gallery_router_delegate.dart # Manages the page stack
│   └── gallery_route_information_parser.dart # Parses route info
│
└── main.dart                 # Main entry point for the app
                              # Application entry point
