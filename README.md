# Wofa Interpreter

**Wofa** is a simple programming language interpreter implemented in Dart. It supports basic operations such as variable declarations, assignments, arithmetic expressions, and print statements. This project demonstrates the fundamental components of a language interpreter, including tokenization, parsing, and evaluation.

## Project Structure

- `ast.dart`: Defines the abstract syntax tree (AST) structures for statements and expressions.
- `tokenizer.dart`: Tokenizes the source code into meaningful symbols (tokens).
- `parser.dart`: Parses the tokens into a structured AST.
- `evaluator.dart`: Evaluates the AST and executes the statements.
- `wofa.dart`: The main entry point that ties everything together.

## Features

- Variable declaration and assignment
- Arithmetic operations (addition, subtraction, multiplication, division)
- Print statements
- Custom language syntax with `wofa` delimiters

## Getting Started

### Prerequisites

- Dart SDK: Make sure you have the Dart SDK installed. You can download it from [Dart's official website](https://dart.dev/get-dart).

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/soltanzadehErfan/wofa.git
   cd wofa
2. **Install dependencies:**
   If your project has dependencies (listed in pubspec.yaml), install them using:
   ```bash
   dart pub get
   
### Usage

1. **Run the interpreter:**
   You can run the interpreter by executing the wofa.dart file:
   ```bash
   dart run bin/wofa.dart
This will tokenize, parse, and evaluate the provided source code.

### Example
Here is an example of how the interpreter processes a simple source code:

**Source Code:**
   ```bash
   wofa var x = 5; wofa
   wofa print x; wofa
   wofa x = x + 1; wofa
   wofa print x; wofa
   wofa x = x / 12; wofa
   wofa print x; wofa
```
**Output:**
   ```bash
5
6
0.5
```

### Usage
Tokenizer: Converts the source code into tokens.
Parser: Converts tokens into an AST.
Evaluator: Evaluates the AST and executes the statements.

### Contributing
Contributions are welcome! If you'd like to contribute to the development of the Wofa interpreter, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and test them thoroughly.
4. Submit a pull request with a clear description of your changes.

### Licensed
This project is licensed under the MIT License - see the LICENSE file for details.
