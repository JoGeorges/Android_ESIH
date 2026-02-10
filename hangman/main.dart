import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const HangmanApp());

class HangmanApp extends StatelessWidget {
  const HangmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HangmanGame(),
    );
  }
}

class HangmanGame extends StatefulWidget {
  const HangmanGame({super.key});

  @override
  State<HangmanGame> createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGame> {
  final List<Map<String, String>> _words = [
    {'word': 'MESI', 'hint': 'Mo pou remèsye moun'},
    {'word': 'KREYOL', 'hint': 'Lang ofisyèl Ayiti'},
    {'word': 'AYITI', 'hint': 'Peyi nan karayib la'},
    {'word': 'ZETWAL', 'hint': 'Ki klere nan syèl lannuit'},
    {'word': 'MANJE', 'hint': 'Sa nou fè lè nou grangou'},
    {'word': 'DLO', 'hint': 'Likid nou bwè pou sante'},
    {'word': 'SOLEY', 'hint': 'Ki bay limyè lajounen'},
  ];

  late String _currentWord, _currentHint;
  late List<String> _guessedLetters, _wrongLetters;
  int _remainingChances = 5;
  bool _gameWon = false, _gameLost = false, _showExitPage = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    final wordData = _words[Random().nextInt(_words.length)];
    setState(() {
      _currentWord = wordData['word']!;
      _currentHint = wordData['hint']!;
      _guessedLetters = [];
      _wrongLetters = [];
      _remainingChances = 5;
      _gameWon = _gameLost = _showExitPage = false;
    });
  }

  void _exitApp() => setState(() => _showExitPage = true);

  void _guessLetter(String letter) {
    if (_gameWon || _gameLost || _guessedLetters.contains(letter) || _showExitPage) return;

    setState(() {
      _guessedLetters.add(letter);
      
      if (_currentWord.contains(letter)) {
        // Vérifier si toutes les lettres uniques ont été devinées
        final uniqueLetters = _currentWord.split('').toSet();
        final guessedCorrect = _guessedLetters.where((l) => _currentWord.contains(l)).toSet();
        if (guessedCorrect.length == uniqueLetters.length) {
          _gameWon = true;
          _gameLost = false;
        }
      } else {
        _wrongLetters.add(letter);
        _remainingChances--;
        if (_remainingChances == 0) {
          _gameLost = true;
          _gameWon = false;
        }
      }
    });
  }

  String _getDisplayWord() => _currentWord.split('').map((char) => _guessedLetters.contains(char) ? char : '*').join();

  Widget _buildKeyboardRow(List<String> letters, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = max(36.0, screenWidth / 12);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: letters.map((letter) {
        final isGuessed = _guessedLetters.contains(letter);
        final isWrong = _wrongLetters.contains(letter);
        final isCorrect = _currentWord.contains(letter) && isGuessed;
        
        return Container(
          margin: EdgeInsets.all(max(2.0, screenWidth / 200)),
          child: ElevatedButton(
            onPressed: isGuessed ? null : () => _guessLetter(letter),
            style: ElevatedButton.styleFrom(
              backgroundColor: isCorrect ? Colors.green.shade100 : isWrong ? Colors.red.shade100 : Colors.grey.shade100,
              foregroundColor: isCorrect ? Colors.green.shade800 : isWrong ? Colors.red.shade800 : Colors.blue.shade800,
              disabledBackgroundColor: Colors.grey.shade300,
              disabledForegroundColor: Colors.grey.shade600,
              minimumSize: Size(buttonSize, buttonSize * 1.25),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonSize / 5),
                side: BorderSide(
                  color: isCorrect ? Colors.green.shade300 : isWrong ? Colors.red.shade300 : Colors.blue.shade300,
                  width: max(1.5, buttonSize / 24),
                ),
              ),
            ),
            child: Text(letter, style: TextStyle(fontSize: max(16.0, buttonSize / 2.5), fontWeight: FontWeight.bold)),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildVirtualKeyboard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildKeyboardRow(['Q','W','E','R','T','Y','U','I','O','P'], context),
        SizedBox(height: max(8.0, MediaQuery.of(context).size.height / 80)),
        _buildKeyboardRow(['A','S','D','F','G','H','J','K','L'], context),
        SizedBox(height: max(8.0, MediaQuery.of(context).size.height / 80)),
        _buildKeyboardRow(['Z','X','C','V','B','N','M'], context),
      ],
    );
  }

  Widget _buildGameScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final wordFontSize = max(24.0, screenWidth / 10);
    final hintSize = max(16.0, screenWidth / 25);
    final explanationSize = max(14.0, screenWidth / 28);
    
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: max(20.0, screenHeight / 25), bottom: max(10.0, screenHeight / 50)),
          child: Text(_getDisplayWord(), style: TextStyle(
            fontSize: wordFontSize, fontWeight: FontWeight.bold, letterSpacing: max(2.0, wordFontSize / 20), color: Colors.blue,
          )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: max(16.0, screenWidth / 25), vertical: max(10.0, screenHeight / 60)),
          child: Column(children: [
            Text('Endis:', style: TextStyle(fontSize: hintSize, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: max(4.0, screenHeight / 150)),
            Text(_currentHint, textAlign: TextAlign.center, style: TextStyle(
              fontSize: explanationSize, fontStyle: FontStyle.italic, color: Colors.black,
            )),
          ]),
        ),
        SizedBox(height: max(20.0, screenHeight / 40)),
        if (_wrongLetters.isNotEmpty) Padding(
          padding: EdgeInsets.all(max(8.0, screenWidth / 50)),
          child: Column(children: [
            Text('Lèt ki pa bon:', style: TextStyle(
              fontSize: explanationSize, color: Colors.red, fontWeight: FontWeight.bold,
            )),
            SizedBox(height: max(4.0, screenHeight / 150)),
            Text(_wrongLetters.join(', '), style: TextStyle(fontSize: max(16.0, screenWidth / 25), color: Colors.red)),
          ]),
        ),
        const Spacer(),
        Padding(padding: EdgeInsets.all(max(8.0, screenWidth / 50)), child: _buildVirtualKeyboard(context)),
        SizedBox(height: max(10.0, screenHeight / 60)),
      ],
    );
  }

  Widget _buildResultScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Vérifier quel message afficher
    final String resultText;
    final String message;
    final Color color;
    final IconData icon;
    
    if (_gameWon) {
      resultText = 'GENYEN! 🎉';
      message = 'Bravo! Ou jwenn mo kòrèk la!';
      color = Colors.green;
      icon = Icons.celebration;
    } else if (_gameLost) {
      resultText = 'PEDI! 😢';
      message = 'Mo ou tap devine a se te: $_currentWord';
      color = Colors.red;
      icon = Icons.sentiment_dissatisfied;
    } else {
      // Cas par défaut (ne devrait pas arriver)
      resultText = 'FINI!';
      message = 'Jwèt la fini.';
      color = Colors.blue;
      icon = Icons.info;
    }
    
    return Center(
      child: Padding(
        padding: EdgeInsets.all(max(16.0, screenWidth / 25)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: max(60.0, screenWidth / 4), color: color),
          SizedBox(height: max(10.0, screenHeight / 40)),
          Text(resultText, style: TextStyle(
            fontSize: max(24.0, screenWidth / 10), fontWeight: FontWeight.bold, color: color,
          )),
          SizedBox(height: max(10.0, screenHeight / 40)),
          Text(message, style: TextStyle(fontSize: max(16.0, screenWidth / 25)), textAlign: TextAlign.center),
          SizedBox(height: max(20.0, screenHeight / 20)),
          Wrap(spacing: max(10.0, screenWidth / 40), runSpacing: max(10.0, screenHeight / 80), alignment: WrapAlignment.center, children: [
            ElevatedButton.icon(
              onPressed: _startNewGame, icon: Icon(Icons.refresh, size: max(20.0, screenWidth / 25)),
              label: Text('Rejwe', style: TextStyle(fontSize: max(14.0, screenWidth / 35))),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: max(15.0, screenWidth / 25), vertical: max(10.0, screenHeight / 80)),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _exitApp, icon: Icon(Icons.exit_to_app, size: max(20.0, screenWidth / 25)),
              label: Text('Kite', style: TextStyle(fontSize: max(14.0, screenWidth / 35))),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: max(15.0, screenWidth / 25), vertical: max(10.0, screenHeight / 80)),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Widget _buildExitPage() => Container(
    color: Colors.white,
    child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.exit_to_app, size: 80, color: Colors.blue),
        SizedBox(height: 20),
        Text('O revwa!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue)),
        SizedBox(height: 10),
        Text('Ou kite jwèt la.', style: TextStyle(fontSize: 20, color: Colors.grey[700], fontStyle: FontStyle.italic)),
        SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: _startNewGame, icon: const Icon(Icons.arrow_back), label: const Text('Retounen'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
        ),
      ]),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showExitPage ? null : AppBar(
        backgroundColor: Colors.blue,
        title: const Padding(padding: EdgeInsets.only(left: 16), child: Text('HANGMAN',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white))),
        automaticallyImplyLeading: false,
        actions: [
          Padding(padding: const EdgeInsets.only(right: 16), child: Row(children: [
            const Icon(Icons.favorite, color: Colors.red),
            const SizedBox(width: 8),
            Text('$_remainingChances', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ])),
        ],
      ),
      body: _showExitPage ? _buildExitPage() : (_gameWon || _gameLost ? _buildResultScreen(context) : _buildGameScreen(context)),
    );
  }
}
