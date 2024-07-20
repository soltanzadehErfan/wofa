import 'package:test/test.dart';
import 'package:wofa/tokenizer.dart';

void main() {
  test('Tokenizer should tokenize a simple program with `wofa` boundaries', () {
    String source = 'wofa var x = 5; wofa\nwofa print x; wofa';
    Tokenizer tokenizer = Tokenizer(source);
    List<Token> tokens = tokenizer.tokenize();

    print('Tokens:');
    for (var token in tokens) {
      print(token);
    }

    expect(tokens.length, 13); // Expected token count
    expect(tokens[0].type, TokenType.WOFA);
    expect(tokens[1].type, TokenType.VAR);
    expect(tokens[2].type, TokenType.IDENTIFIER);
    expect(tokens[3].type, TokenType.ASSIGN);
    expect(tokens[4].type, TokenType.NUMBER);
    expect(tokens[5].type, TokenType.SEMICOLON);
    expect(tokens[6].type, TokenType.WOFA);
    expect(tokens[7].type, TokenType.WOFA);
    expect(tokens[8].type, TokenType.PRINT);
    expect(tokens[9].type, TokenType.IDENTIFIER);
    expect(tokens[10].type, TokenType.SEMICOLON);
    expect(tokens[11].type, TokenType.WOFA);
    expect(tokens[12].type, TokenType.EOF);
  });
}
