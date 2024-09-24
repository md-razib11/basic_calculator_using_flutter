import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstNumberTEController = TextEditingController();
  final TextEditingController secondNumberTEController = TextEditingController();
  double result = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('First Number', firstNumberTEController),
              const SizedBox(height: 16),
              _buildTextField('Second Number', secondNumberTEController),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildButtonRow(),
              ),
              Text(
                'Result: $result',
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Method to create a reusable TextFormField
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: label,
        labelText: label,
      ),
    );
  }

  // Method to build the row of arithmetic operation buttons
  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildOperationButton('+', () => _performOperation('+')),
        _buildOperationButton('-', () => _performOperation('-')),
        _buildOperationButton('*', () => _performOperation('*')),
        _buildOperationButton('/', () => _performOperation('/')),
      ],
    );
  }

  // Helper method to create each button
  Widget _buildOperationButton(String symbol, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: () {
        onPressed();
        setState(() {});
      },
      child: Text(
        symbol,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  // Unified method to handle all operations
  void _performOperation(String operation) {
    if (_formKey.currentState!.validate()) {
      double firstNumber = double.tryParse(firstNumberTEController.text) ?? 0;
      double secondNumber = double.tryParse(secondNumberTEController.text) ?? 0;

      switch (operation) {
        case '+':
          result = firstNumber + secondNumber;
          break;
        case '-':
          result = firstNumber - secondNumber;
          break;
        case '*':
          result = firstNumber * secondNumber;
          break;
        case '/':
          result = secondNumber != 0 ? firstNumber / secondNumber : 0;
          break;
      }
    }
  }

  @override
  void dispose() {
    firstNumberTEController.dispose();
    secondNumberTEController.dispose();
    super.dispose();
  }
}
