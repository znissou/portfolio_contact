<img src="https://github.com/user-attachments/assets/7a323c92-c22c-4e28-b605-58a150fefc13">

# Portfolio Contact Section - Flutter Web

This is a Flutter Web contact section that I created to be embedded as an iframe in my existing portfolio website. It provides a clean, responsive contact form for visitors to get in touch.

## Features

- Responsive design that works on all devices
- Clean, modern UI with Material Design components
- Form validation for email and required fields
- Easy integration via iframe embedding
- Lightweight and fast loading

## Installation

To run this project locally:

```bash
# Clone the repository
git clone https://github.com/znissou/portfolio_contact.git

# Navigate to the project directory
cd portfolio_contact

# Get dependencies
flutter pub get

# Run the app
flutter run -d chrome
```

## Usage

This contact section is designed to be embedded in your existing portfolio website using an iframe:

```html
<iframe src="https://your-domain.com/contact" width="100%" height="600px" frameborder="0"></iframe>
```

## Technologies

- **Flutter Web** - For cross-platform web development
- **Dart** - Programming language
- **Material Design** - UI components and styling
- **URL Launcher** - For handling external links
- **HTTP** - For form submission

## Project Structure

```
lib/
├── main.dart          # Entry point
├── constants.dart     # App constants and themes
├── views/             # UI components
│   ├── home_screen.dart
│   └── contact_section/
│       ├── contact_section.dart
│       └── components/
└── models/            # Data models
```

The project is ready to be deployed as a standalone web app or embedded in your existing portfolio.
