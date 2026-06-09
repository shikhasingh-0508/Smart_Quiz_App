#  Smart Quiz App (CLI)

A command-line based quiz application developed using **Dart** that demonstrates practical implementation of **Object-Oriented Programming (OOP)**, **Asynchronous Programming**, **File Handling**, and **JSON Data Management**.

This project was developed as a **Minor Project** for the **App Development Program Module** at **Unlox Academy (Rivoquix Learning Private Limited)**.

---

##  Overview

Smart Quiz App is an interactive terminal-based quiz system that allows users to test their knowledge through multiple quiz categories. The application provides real-time scoring, performance tracking, persistent result storage, and category-wise leaderboards.

The project focuses on applying core software development principles while creating a practical and user-friendly command-line application.

---

##  Project Objectives

The application was designed to demonstrate the following concepts:

### Object-Oriented Programming (OOP)

* Data encapsulation through custom classes.
* Abstraction of quiz functionalities.
* Reusable and maintainable code structure.
* Separation of concerns using models and business logic.

### Asynchronous Programming

* Non-blocking file operations using `async` and `await`.
* Efficient loading of quiz questions.
* Smooth leaderboard and result management.

### File Handling

* Reading quiz questions from external JSON files.
* Writing user performance records to local storage.
* Persistent data management across multiple executions.

### JSON Parsing & Data Modeling

* Decoding JSON data into Dart objects.
* Mapping structured data to custom models.
* Dynamic loading of category-specific question banks.

---

##  Features

###  Interactive CLI Interface

* Colorful terminal output using ANSI color codes.
* Clear feedback for correct and incorrect answers.
* Improved user experience with organized console displays.

###  Multiple Quiz Categories

* Dart Basics Quiz
* OOP Concepts Quiz
* Dynamic question loading based on category selection.

###  Input Validation

* Prevents invalid option selection.
* Handles incorrect user inputs safely.
* Reduces runtime errors through validation loops.

###  Performance Tracking

* Stores:

  * User Name
  * Student ID
  * Quiz Category
  * Final Score
  * Time Taken

###  Category-Wise Leaderboards

* Automatically ranks participants based on:

  1. Highest score
  2. Lowest completion time
* Displays Top 5 performers after quiz completion.

### Persistent Result Storage

* Results remain available between application runs.
* Separate result files maintained for each quiz category.

---

##  Project Structure

```plaintext
smart_quiz_app/
│
├── bin/
│   └── smart_quiz_app.dart
│       # Main application entry point
│
├── lib/
│   ├── questions.dart
│   │   # Question model and JSON conversion logic
│   │
│   └── quiz_engine.dart
│       # Core quiz processing, scoring, validation, and leaderboard logic
│
├── dart_basics.json
│   # Question bank for Dart Basics category
│
├── oop_concepts.json
│   # Question bank for OOP Concepts category
│
├── results_dart_basics.txt
│   # Stored results for Dart Basics quizzes
│
├── results_oop_concepts.txt
│   # Stored results for OOP Concepts quizzes
│
└── README.md
```

---

##  Technologies Used

* Dart
* JSON
* File I/O
* Async/Await Programming
* Object-Oriented Programming

---

##  Getting Started

### Prerequisites

Ensure that the Dart SDK is installed and configured properly.

Check installation:

```bash
dart --version
```

Download Dart SDK from:

https://dart.dev/get-dart

---

##  Installation

Clone the repository:

```bash
git clone https://github.com/shikhasingh-0508/Smart_Quiz_App.git
```

Navigate into the project directory:

```bash
cd Smart_Quiz_App
```

Install dependencies:

```bash
dart pub get
```

---

##  Running the Application

Start the quiz application:

```bash
dart run
```

---

##  How It Works

1. User enters:

   * Name
   * Student ID

2. User selects a quiz category:

   * Dart Basics
   * OOP Concepts

3. Questions are loaded dynamically from the corresponding JSON file.

4. The quiz timer starts automatically.

5. User answers all questions.

6. After completion:

   * Score is calculated.
   * Completion time is measured.
   * Result is saved to a local file.

7. Leaderboard is generated and displayed.

---

##  Result Storage Format

Each quiz attempt is saved with:

```plaintext
Name: Abc
Student ID: 12345
Score: 8/10
Time Taken: 42 seconds
```

Results are stored in category-specific files:

```plaintext
results_dart_basics.txt
results_oop_concepts.txt
```

---

##  Leaderboard Ranking Logic

Participants are ranked using:

1. Higher score first
2. Lower completion time second

Example:

```plaintext
Rank  Name          Score   Time
--------------------------------
1     Abc            9/10    30s
2     pqr            9/10    45s
3     xyz            8/10    25s
```

---

## Future Enhancements

* Additional quiz categories
* Randomized question ordering
* Difficulty levels
* Negative marking support
* CSV/Excel result export
* Database integration
* User authentication
* Timer-based questions

---

##  Author

**Shikha Singh**

Minor Project Submission

App Development Program

Unlox Academy (Rivoquix Learning Private Limited)

---

##  License

This project is developed for educational and learning purposes.

Feel free to use, modify, and enhance it for academic projects and personal learning.
