# Student Grade Tracker

Student Grade Tracker is a Flutter app where a student can add subjects with marks, view the calculated grade for each subject, and see a live summary of overall performance.

## Features

* Add a subject with its mark
* Validate subject name and mark input
* Automatically calculate grade for each subject
* View all subjects in a subject list
* Delete subjects with swipe using Dismissible
* See a summary screen with:

  * total number of subjects
  * average mark
  * overall grade
* Light and dark theme toggle
* Theme preference saved using SharedPreferences
* State management using Provider

## Requirements Covered

* Subject class with:

  * `name`
  * private `_mark` field
  * `grade` getter
* Subjects stored in a `List<Subject>`
* `.where()` / `.map()` used in the project
* Add Subject screen with validation
* Subject List screen using `ListView.builder`
* Delete subject with `Dismissible`
* Summary screen updates live when subjects are added or removed
* Custom light and dark themes
* No `setState` used for app state
* Public GitHub repository with meaningful commits and README

## Tech Stack

* Flutter
* Dart
* Provider
* SharedPreferences

## Project Structure

```bash
lib/
├── models/
│   └── subjectmodel.dart
├── providers/
│   ├── navigation_provider.dart
│   ├── subject_provider.dart
│   └── thema.dart
├── screens/
│   ├── add_subject.dart
│   ├── navigation_screen.dart
│   ├── subject_list.dart
│   └── summary.dart
├── Theme/
│   └── customapptheme.dart
├── utils/
│   └── sharedpref.dart
└── main.dart
```

## How to Run

1. Clone the repository:

   ```bash
   git clone <your-repo-link>
   ```

2. Go to the project folder:

   ```bash
   cd Student-Grade-Tracker
   ```

3. Get dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Notes

* Theme mode is saved locally using SharedPreferences.
* Subject list and summary are managed with Provider.
