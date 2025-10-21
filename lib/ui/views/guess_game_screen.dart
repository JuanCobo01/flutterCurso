import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuessGameScreen extends StatefulWidget {
  const GuessGameScreen({super.key});

  @override
  State<GuessGameScreen> createState() => _GuessGameScreenState();
}

class _GuessGameScreenState extends State<GuessGameScreen> {
  late int _targetNumber;
  int _attempts = 0;
  int _maxAttempts = 7;
  String _feedback = '';
  bool _gameWon = false;
  bool _gameOver = false;
  final TextEditingController _guessController = TextEditingController();
  final List<int> _previousGuesses = [];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _targetNumber = Random().nextInt(100) + 1; // 1-100
      _attempts = 0;
      _feedback = '🎯 ¡Adivina el número entre 1 y 100!';
      _gameWon = false;
      _gameOver = false;
      _previousGuesses.clear();
      _guessController.clear();
    });
  }

  void _makeGuess() {
    final guessText = _guessController.text;
    if (guessText.isEmpty) return;

    final guess = int.tryParse(guessText);
    if (guess == null || guess < 1 || guess > 100) {
      setState(() {
        _feedback = '❌ Por favor ingresa un número entre 1 y 100';
      });
      return;
    }

    if (_previousGuesses.contains(guess)) {
      setState(() {
        _feedback = '🔄 Ya probaste el número $guess';
      });
      return;
    }

    setState(() {
      _attempts++;
      _previousGuesses.add(guess);
      _guessController.clear();

      if (guess == _targetNumber) {
        _gameWon = true;
        _gameOver = true;
        _feedback = '🎉 ¡Felicidades! Adivinaste en $_attempts intentos';
      } else if (_attempts >= _maxAttempts) {
        _gameOver = true;
        _feedback = '😔 Se acabaron los intentos. El número era $_targetNumber';
      } else {
        final difference = (guess - _targetNumber).abs();
        String hint;
        
        if (difference <= 5) {
          hint = '🔥 ¡Muy caliente!';
        } else if (difference <= 15) {
          hint = '🌡️ Caliente';
        } else if (difference <= 25) {
          hint = '🆒 Tibio';
        } else {
          hint = '🧊 Frío';
        }

        if (guess < _targetNumber) {
          _feedback = '📈 $hint El número es MAYOR que $guess';
        } else {
          _feedback = '📉 $hint El número es MENOR que $guess';
        }
      }
    });
  }

  Color _getGuessColor(int guess) {
    final difference = (guess - _targetNumber).abs();
    if (guess == _targetNumber) return Colors.green;
    if (difference <= 5) return Colors.orange;
    if (difference <= 15) return Colors.yellow;
    if (difference <= 25) return Colors.blue;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎲 Juego de Adivinanza'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _startNewGame,
            tooltip: 'Nuevo juego',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Game status
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      _feedback,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '$_attempts',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            const Text('Intentos'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${_maxAttempts - _attempts}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const Text('Restantes'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),

            // Input section
            if (!_gameOver) ...[
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _guessController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Tu número (1-100)',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.casino),
                      ),
                      onSubmitted: (_) => _makeGuess(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _makeGuess,
                    child: const Text('Adivinar'),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 20),

            // Previous guesses
            if (_previousGuesses.isNotEmpty) ...[
              const Text(
                'Intentos anteriores:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _previousGuesses.length,
                  itemBuilder: (context, index) {
                    final guess = _previousGuesses[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: _getGuessColor(guess),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          guess.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],

            // Game over actions
            if (_gameOver) ...[
              const SizedBox(height: 20),
              Column(
                children: [
                  Icon(
                    _gameWon ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                    size: 80,
                    color: _gameWon ? Colors.amber : Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _startNewGame,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Jugar de nuevo'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }
}