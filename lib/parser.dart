import 'ast.dart';
import 'tokenizer.dart';

class Parser {
  final List<Token> tokens;
  int current = 0;

  Parser(this.tokens);

  List<Statement> parse() {
    List<Statement> statements = [];
    while (!isAtEnd()) {
      consume(TokenType.WOFA, 'Expected "wofa" at the start of a statement');
      statements.add(parseStatement());
      consume(TokenType.WOFA, 'Expected "wofa" at the end of a statement');
    }
    return statements;
  }

  Statement parseStatement() {
    if (match([TokenType.VAR])) {
      return parseVariableDeclaration();
    }
    if (match([TokenType.PRINT])) {
      return parsePrintStatement();
    }
    if (check(TokenType.IDENTIFIER)) {
      return parseAssignment();
    }
    throw Exception('Unexpected token: ${peek().lexeme}');
  }

  VariableDeclaration parseVariableDeclaration() {
    String name = consume(TokenType.IDENTIFIER, 'Expected variable name').lexeme;
    consume(TokenType.ASSIGN, 'Expected "=" after variable name');
    Expression expression = parseExpression();
    consume(TokenType.SEMICOLON, 'Expected ";" after variable declaration');
    return VariableDeclaration(name, expression);
  }

  PrintStatement parsePrintStatement() {
    String name = consume(TokenType.IDENTIFIER, 'Expected variable name').lexeme;
    consume(TokenType.SEMICOLON, 'Expected ";" after variable name');
    return PrintStatement(name);
  }

  Assignment parseAssignment() {
    String name = consume(TokenType.IDENTIFIER, 'Expected variable name').lexeme;
    consume(TokenType.ASSIGN, 'Expected "=" after variable name');
    Expression expression = parseExpression();
    consume(TokenType.SEMICOLON, 'Expected ";" after assignment');
    return Assignment(name, expression);
  }

  Expression parseExpression() {
    return parseTerm();
  }

  Expression parseTerm() {
    Expression expr = parseFactor();
    while (match([TokenType.PLUS, TokenType.MINUS])) {
      String operator = previous().lexeme;
      Expression right = parseFactor();
      expr = BinaryExpression(expr, operator, right);
    }
    return expr;
  }

  Expression parseFactor() {
    Expression expr = parseUnary();
    while (match([TokenType.STAR, TokenType.SLASH])) {
      String operator = previous().lexeme;
      Expression right = parseUnary();
      expr = BinaryExpression(expr, operator, right);
    }
    return expr;
  }

  Expression parseUnary() {
    if (match([TokenType.MINUS])) {
      String operator = previous().lexeme;
      Expression right = parseUnary();
      return UnaryExpression(operator, right);
    }
    return parsePrimary();
  }

  Expression parsePrimary() {
    if (match([TokenType.NUMBER])) {
      return Literal(int.parse(previous().lexeme));
    }
    if (match([TokenType.IDENTIFIER])) {
      return Variable(previous().lexeme);
    }
    throw Exception('Unexpected token');
  }

  bool match(List<TokenType> types) {
    for (TokenType type in types) {
      if (check(type)) {
        advance();
        return true;
      }
    }
    return false;
  }

  bool check(TokenType type) {
    if (isAtEnd()) return false;
    return peek().type == type;
  }

  Token advance() {
    if (!isAtEnd()) current++;
    return previous();
  }

  bool isAtEnd() {
    return peek().type == TokenType.EOF;
  }

  Token peek() {
    return tokens[current];
  }

  Token previous() {
    return tokens[current - 1];
  }

  Token consume(TokenType type, String message) {
    if (check(type)) return advance();
    throw Exception(message);
  }
}
