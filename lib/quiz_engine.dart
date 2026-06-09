import 'dart:convert';
import 'dart:io';
import 'questions.dart';

const String reset = '\x1B[0m';
const String red = '\x1B[31m';
const String green = '\x1B[32m';
const String yellow = '\x1B[33m';
const String cyan = '\x1B[36m';
const String magenta = '\x1B[35m';

class QuizEngine {
  List<Question> questions = [];
  int score = 0;

  Future<void> loadQuestions(String filePath) async {
    try {
      final file = File(filePath);
      final String content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);
      questions = jsonData.map((q) => Question.fromJson(q)).toList();
    } catch (e) {
      print("$red Error loading questions: $e$reset");
    }
  }

  void checkAnswer(int questionIndex, int userChoice) {
    if (userChoice == questions[questionIndex].correctAnswerIndex) {
      score++;
      print("$green Correct! +1 Point$reset");
    } else {
      int correctIdx = questions[questionIndex].correctAnswerIndex;
      String correctAns = questions[questionIndex].options[correctIdx];
      print("$red Wrong answer. The correct answer was: $correctAns$reset");
    }
  }

  //  Modified to accept categoryName for segmented file storage
  Future<void> saveResult(String userName, String userId, Duration timeTaken, String categoryName) async {
    try {
      // Creates a clean filename like 'results_dart_basics.txt'
      final fileName = 'results_${categoryName.toLowerCase().replaceAll(' ', '_')}.txt';
      final file = File(fileName);
      
      final date = DateTime.now().toString().split('.')[0];
      // Concept explicitly tagged inside the log record
      final dataToSave = "[$date] Name: $userName (ID: $userId) | Quiz: $categoryName | Score: $score/${questions.length} | Time: ${timeTaken.inSeconds}s\n";
      
      await file.writeAsString(dataToSave, mode: FileMode.append);
      print("$cyan(System: Result saved to $fileName)$reset");
    } catch (e) {
      print("$red Error saving result: $e$reset");
    }
  }

  //  Modified to load a distinct leaderboard based on the chosen concept
  Future<void> displayLeaderboard(String categoryName) async {
    final fileName = 'results_${categoryName.toLowerCase().replaceAll(' ', '_')}.txt';
    final file = File(fileName);
    
    if (!await file.exists()) {
      print("\n$magenta========== 🏆 LEADERBOARD: $categoryName 🏆 ==========$reset");
      print("No records found yet for this category. Be the first!");
      print("$magenta==================================================$reset\n");
      return;
    }

    try {
      List<String> lines = await file.readAsLines();
      if (lines.isEmpty) return;

      print("\n$magenta========== 🏆 LEADERBOARD: ${categoryName.toUpperCase()} 🏆 ==========$reset");
      
      // Sort lines by highest score, then lowest time
      lines.sort((a, b) {
        try {
          int scoreA = int.parse(a.split('Score: ')[1].split('/')[0]);
          int scoreB = int.parse(b.split('Score: ')[1].split('/')[0]);
          int timeA = int.parse(a.split('Time: ')[1].split('s')[0]);
          int timeB = int.parse(b.split('Time: ')[1].split('s')[0]);

          if (scoreA != scoreB) return scoreB.compareTo(scoreA); 
          return timeA.compareTo(timeB); 
        } catch (e) {
          return 0;
        }
      });

      // Show top 5 performances for this specific quiz
      int limit = lines.length < 5 ? lines.length : 5;
      for (int i = 0; i < limit; i++) {
        print("$yellow${i + 1}. ${lines[i]}$reset");
      }
      print("$magenta==================================================$reset\n");
    } catch (e) {
      print("$red Error loading leaderboard.$reset");
    }
  }
}