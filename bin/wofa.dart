import 'package:wofa/ast.dart';
import 'package:wofa/tokenizer.dart';
import 'package:wofa/parser.dart';
import 'package:wofa/evaluator.dart';

void main() {
  String sourceCode = '''
wofa var x = 5; wofa
wofa print x; wofa
wofa x = x + 1; wofa
wofa print x; wofa
wofa x = x / 12; wofa
wofa print x; wofa
''';

  Tokenizer tokenizer = Tokenizer(sourceCode);
  List<Token> tokens = tokenizer.tokenize();

  Parser parser = Parser(tokens);
  List<Statement> statements = parser.parse();

  Evaluator evaluator = Evaluator();
  for (var statement in statements) {
    evaluator.evaluate(statement);
  }
}
