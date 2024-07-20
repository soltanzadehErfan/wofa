import 'package:test/test.dart';
import 'package:wofa/ast.dart';
import 'package:wofa/parser.dart';
import 'package:wofa/tokenizer.dart';

void main() {
  test('Parser should parse a variable declaration', () {
    String source = 'wofa var x = 5; wofa';
    Tokenizer tokenizer = Tokenizer(source);
    List<Token> tokens = tokenizer.tokenize();
    Parser parser = Parser(tokens);
    List<Statement> statements = parser.parse();

    expect(statements.length, 1);
    expect(statements[0], isA<VariableDeclaration>());
    VariableDeclaration stmt = statements[0] as VariableDeclaration;
    expect(stmt.name, 'x');
    expect(stmt.expression, isA<Literal>());
    Literal expr = stmt.expression as Literal;
    expect(expr.value, 5);
  });

  test('Parser should parse a print statement', () {
    String source = 'wofa print x; wofa';
    Tokenizer tokenizer = Tokenizer(source);
    List<Token> tokens = tokenizer.tokenize();
    Parser parser = Parser(tokens);
    List<Statement> statements = parser.parse();

    expect(statements.length, 1);
    expect(statements[0], isA<PrintStatement>());
    PrintStatement stmt = statements[0] as PrintStatement;
    expect(stmt.name, 'x');
  });

  test('Parser should parse an assignment statement', () {
    String source = 'wofa x = x + 1; wofa';
    Tokenizer tokenizer = Tokenizer(source);
    List<Token> tokens = tokenizer.tokenize();
    Parser parser = Parser(tokens);
    List<Statement> statements = parser.parse();

    expect(statements.length, 1);
    expect(statements[0], isA<Assignment>());
    Assignment stmt = statements[0] as Assignment;
    expect(stmt.name, 'x');
    expect(stmt.expression, isA<BinaryExpression>());
    BinaryExpression expr = stmt.expression as BinaryExpression;
    expect(expr.left, isA<Variable>());
    expect(expr.operator, '+');
    expect(expr.right, isA<Literal>());
  });
}
