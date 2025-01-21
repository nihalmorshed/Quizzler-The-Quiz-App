# Flutter Quiz Application

A simple yet engaging quiz application built with Flutter that tests users' knowledge through true/false questions. The app features a clean, modern interface with instant feedback and score tracking.

## Features

* True/False quiz format
* Real-time score tracking with visual indicators
* Progress visualization through checkmarks and crosses
* Final score display upon completion
* Option to restart the quiz
* Clean and intuitive user interface
* Dark theme for better readability

## Getting Started

### Prerequisites

* Flutter SDK (>=2.19.4 <3.0.0)
* Dart SDK
* Android Studio/VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/nihalmorshed/Quizzler-The-Quiz-App.git
```

2. Navigate to the project directory:
```bash
cd Quizzler-The-Quiz-App
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the application:
```bash
flutter run
```

## Dependencies

* `flutter_alert: ^2.0.4` - For displaying completion alerts
* `cupertino_icons: ^1.0.2` - For iOS style icons

## Project Structure

```
lib/
  ├── main.dart          # Main application entry point
  ├── question.dart      # Question model class
  ├── quizbrain.dart     # Quiz logic and question bank
```

## How to Use

1. Launch the application
2. Read the displayed question
3. Select either 'True' or 'False' as your answer
4. Get immediate feedback through checkmark/cross icons
5. Complete all questions to see your final score
6. Choose to restart the quiz when finished

## Contributing

Contributions are welcome! Feel free to submit pull requests or open issues for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

