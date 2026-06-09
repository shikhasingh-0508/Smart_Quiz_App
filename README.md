Smart Quiz App (CLI)A simple command-line quiz application built using the Dart programming language. This project was created as a Minor Project to practice object-oriented programming, async/await features, file handling, and JSON parsing.  Developed for the App Development Program at Unlox Academy (Rivoquix Learning Private Limited).  🎯 Project GoalsThis project focuses on learning and implementing key programming benchmarks:  Object-Oriented Programming (OOP): Using classes, objects, and encapsulation to organize code cleanly.  Async/Await: Handling asynchronous background tasks, such as reading files, without freezing the app.  File I/O: Reading setup data and appending player progress scores directly to local text files.  JSON Handling: Converting and parsing structured question text data banks.  🚀 FeaturesColorized Terminal: Uses bright ANSI text colors (Green, Red, Cyan, Magenta) to make reading text easy.Two Quiz Categories: Gives players a choice between a "Dart Basics" quiz or an "OOP Concepts" quiz topic.  Input Validation: Prevents unexpected system crashes or skipped questions if someone accidentally types a letter instead of a valid choice number.Score & Time Tracking: Calculates total points and measures the exact number of seconds taken to finish the quiz.  Separate Local Leaderboards: Saves histories to isolated text files to build and display a customized Top 5 high-score board at the end of the run.  📂 Folder StructurePlaintextsmart_quiz_app/
├── bin/
│   └── smart_quiz_app.dart       # Runs the main quiz engine loop and captures text inputs
├── lib/
│   ├── questions.dart            # Manages the data model mapping for quiz questions
│   └── quiz_engine.dart          # Processes scores, checks inputs, handles file I/O, and sorts ranks
├── dart_basics.json              # Question pool data for the basic language quiz
├── oop_concepts.json             # Question pool data for the object-oriented design quiz
└── README.md                     # Documentation file
How to Run the AppPrerequisitesMake sure you have the Dart SDK installed and configured on your machine.Steps to RunClone the project repository from GitHub:Bashgit clone https://github.com/shikhasingh-0508/Smart_Quiz_App.git
cd Smart_Quiz_App
Download required dependencies:Bashdart pub get
Start the application:Bashdart run
