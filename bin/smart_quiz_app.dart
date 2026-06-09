import 'dart:io';
import 'package:smart_quiz_app/quiz_engine.dart';

void main() async {
  final engine = QuizEngine();

  print("\n$cyan======================================$reset");
  print("$cyan      WELCOME TO THE SMART QUIZ!      $reset");
  print("$cyan======================================$reset");

  stdout.write("${yellow}Enter your Name:${reset} ");
  String userName = stdin.readLineSync() ?? "Unknown User";

  stdout.write("${yellow}Enter your ID Number:${reset} ");
  String userId = stdin.readLineSync() ?? "Unknown ID";

  print("\n$cyan--- Select a Quiz Category ---$reset");
  print("1. Dart Basics");
  print("2. OOP Concepts");
  
  String selectedFile = '';
  String categoryLabel = ''; // Tracks the concept string dynamically
  
  while (selectedFile.isEmpty) {
    stdout.write("${yellow}Enter category number (1 or 2):${reset} ");
    String? categoryChoice = stdin.readLineSync();
    if (categoryChoice == '1') {
      selectedFile = 'dart_basics.json';
      categoryLabel = 'Dart Basics';
    } else if (categoryChoice == '2') {
      selectedFile = 'oop_concepts.json';
      categoryLabel = 'OOP Concepts';
    } else {
      print("$red Invalid selection. Please enter 1 or 2.$reset");
    }
  }

  await engine.loadQuestions(selectedFile);

  if (engine.questions.isEmpty) {
    print("$red No questions found. Exiting...$reset");
    return;
  }

  print("\n$green>>> Hello, $userName (ID: $userId)! Starting $categoryLabel Quiz... <<<$reset");

  final startTime = DateTime.now();

  for (var i = 0; i < engine.questions.length; i++) {
    var q = engine.questions[i];
    print("\n$cyan[Question ${i + 1}/${engine.questions.length}]$reset ${q.text}");

    for (var j = 0; j < q.options.length; j++) {
      print("  $j. ${q.options[j]}");
    }

    int validChoice = -1;
    while (true) {
      stdout.write("${yellow}Your answer (enter number):${reset} ");
      String? input = stdin.readLineSync();
      int? choice = int.tryParse(input ?? "");

      if (choice != null && choice >= 0 && choice < q.options.length) {
        validChoice = choice;
        break; 
      } else {
        print("$red Invalid input. Please enter a valid number between 0 and ${q.options.length - 1}.$reset");
      }
    }

    engine.checkAnswer(i, validChoice);
  }

  final endTime = DateTime.now();
  final timeTaken = endTime.difference(startTime);

  //  Performance Output Block
  print("\n====================================");
  print("$magenta          QUIZ FINISHED!          $reset");
  print("====================================");
  print(" Name: $userName");
  print(" ID Number: $userId");
  print(" Concept: $categoryLabel");
  print(" Time Taken: ${timeTaken.inSeconds} seconds");
  print(" Final Score: $green${engine.score} / ${engine.questions.length}$reset");
  print("====================================");

  // 1. Persist the metrics to the distinct concept file
  await engine.saveResult(userName, userId, timeTaken, categoryLabel);

  // 2. Display the category leaderboard right at the end
  await engine.displayLeaderboard(categoryLabel);
}