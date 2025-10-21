import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _previousNumber = '';
  String _operation = '';
  bool _waitingForOperand = false;

  void _inputNumber(String number) {
    setState(() {
      if (_waitingForOperand) {
        _display = number;
        _waitingForOperand = false;
      } else {
        _display = _display == '0' ? number : _display + number;
      }
    });
  }

  void _inputOperation(String nextOperation) {
    double inputValue = double.parse(_display);

    if (_previousNumber.isEmpty) {
      _previousNumber = inputValue.toString();
    } else if (_operation.isNotEmpty) {
      double prevValue = double.parse(_previousNumber);
      double result = _performCalculation(prevValue, inputValue, _operation);
      
      setState(() {
        _display = result % 1 == 0 ? result.toInt().toString() : result.toString();
        _previousNumber = _display;
      });
    }

    setState(() {
      _waitingForOperand = true;
      _operation = nextOperation;
    });
  }

  double _performCalculation(double firstOperand, double secondOperand, String operation) {
    switch (operation) {
      case '+':
        return firstOperand + secondOperand;
      case '-':
        return firstOperand - secondOperand;
      case '×':
        return firstOperand * secondOperand;
      case '÷':
        return firstOperand / secondOperand;
      default:
        return secondOperand;
    }
  }

  void _clear() {
    setState(() {
      _display = '0';
      _previousNumber = '';
      _operation = '';
      _waitingForOperand = false;
    });
  }

  void _calculate() {
    if (_previousNumber.isNotEmpty && _operation.isNotEmpty) {
      double inputValue = double.parse(_display);
      double prevValue = double.parse(_previousNumber);
      double result = _performCalculation(prevValue, inputValue, _operation);
      
      setState(() {
        _display = result % 1 == 0 ? result.toInt().toString() : result.toString();
        _previousNumber = '';
        _operation = '';
        _waitingForOperand = true;
      });
    }
  }

  Widget _buildButton(String text, {Color? color, VoidCallback? onPressed}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧮 Calculadora'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.black12,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _display,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          // Buttons
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  // Row 1
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('C', color: Colors.red, onPressed: _clear),
                        _buildButton('±', color: Colors.grey, onPressed: () {}),
                        _buildButton('%', color: Colors.grey, onPressed: () {}),
                        _buildButton('÷', color: Colors.orange, onPressed: () => _inputOperation('÷')),
                      ],
                    ),
                  ),
                  // Row 2
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('7', onPressed: () => _inputNumber('7')),
                        _buildButton('8', onPressed: () => _inputNumber('8')),
                        _buildButton('9', onPressed: () => _inputNumber('9')),
                        _buildButton('×', color: Colors.orange, onPressed: () => _inputOperation('×')),
                      ],
                    ),
                  ),
                  // Row 3
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('4', onPressed: () => _inputNumber('4')),
                        _buildButton('5', onPressed: () => _inputNumber('5')),
                        _buildButton('6', onPressed: () => _inputNumber('6')),
                        _buildButton('-', color: Colors.orange, onPressed: () => _inputOperation('-')),
                      ],
                    ),
                  ),
                  // Row 4
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('1', onPressed: () => _inputNumber('1')),
                        _buildButton('2', onPressed: () => _inputNumber('2')),
                        _buildButton('3', onPressed: () => _inputNumber('3')),
                        _buildButton('+', color: Colors.orange, onPressed: () => _inputOperation('+')),
                      ],
                    ),
                  ),
                  // Row 5
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(20),
                              ),
                              onPressed: () => _inputNumber('0'),
                              child: const Text(
                                '0',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        _buildButton('.', onPressed: () => _inputNumber('.')),
                        _buildButton('=', color: Colors.orange, onPressed: _calculate),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}