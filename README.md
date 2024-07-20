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
