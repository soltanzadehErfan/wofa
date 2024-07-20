enum TokenType { WOFA, VAR, PRINT, IDENTIFIER, NUMBER, ASSIGN, PLUS, MINUS, STAR, SLASH, SEMICOLON, EOF }

class Token {
  final TokenType type;
  final String lexeme;
  Token(this.type, this.lexeme);
}

class Tokenizer {
  final String source;
  int current = 0;
  List<Token> tokens = [];

  Tokenizer(this.source);

  List<Token> tokenize() {
    while (current < source.length) {
      String char = source[current];
      if (char == ' ' || char == '\n') {
        current++;
        continue;
      }
      if (char == 'w' && source.startsWith('wofa', current)) {
        tokens.add(Token(TokenType.WOFA, 'wofa'));
        current += 4;
        continue;
      }
      if (char == ';') {
        tokens.add(Token(TokenType.SEMICOLON, char));
        current++;
        continue;
      }
      if (char == '=') {
        tokens.add(Token(TokenType.ASSIGN, char));
        current++;
        continue;
      }
      if (char == '+') {
        tokens.add(Token(TokenType.PLUS, char));
        current++;
        continue;
      }
      if (char == '-') {
        tokens.add(Token(TokenType.MINUS, char));
        current++;
        continue;
      }
      if (char == '*') {
        tokens.add(Token(TokenType.STAR, char));
        current++;
        continue;
      }
      if (char == '/') {
        tokens.add(Token(TokenType.SLASH, char));
        current++;
        continue;
      }
      if (char == 'v' && source.startsWith('var', current)) {
        tokens.add(Token(TokenType.VAR, 'var'));
        current += 3;
        continue;
      }
      if (char == 'p' && source.startsWith('print', current)) {
        tokens.add(Token(TokenType.PRINT, 'print'));
        current += 5;
        continue;
      }
      if (RegExp(r'[a-zA-Z_]').hasMatch(char)) {
        String identifier = '';
        while (current < source.length && RegExp(r'[a-zA-Z0-9_]').hasMatch(source[current])) {
          identifier += source[current];
          current++;
        }
        tokens.add(Token(TokenType.IDENTIFIER, identifier));
        continue;
      }
      if (RegExp(r'[0-9]').hasMatch(char)) {
        String number = '';
        while (current < source.length && RegExp(r'[0-9]').hasMatch(source[current])) {
          number += source[current];
          current++;
        }
        tokens.add(Token(TokenType.NUMBER, number));
        continue;
      }
      current++;
    }
    tokens.add(Token(TokenType.EOF, ''));
    return tokens;
  }
}
