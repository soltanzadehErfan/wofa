import 'package:test/test.dart';
import 'package:wofa/ast.dart';
import 'package:wofa/evaluator.dart';


void main() {
  test('Evaluator should evaluate variable declarations', () {
    Evaluator evaluator = Evaluator();
    VariableDeclaration stmt = VariableDeclaration('x', Literal(5));
    evaluator.evaluate(stmt);
    expect(evaluator.variables['x'], 5);
  });

  test('Evaluator should evaluate print statements', () {
    Evaluator evaluator = Evaluator();
    evaluator.variables['x'] = 5;
    PrintStatement stmt = PrintStatement('x');
    expect(() => evaluator.evaluate(stmt), prints('5\n'));
  });

  test('Evaluator should evaluate assignments', () {
    Evaluator evaluator = Evaluator();
    evaluator.variables['x'] = 5;
    Assignment stmt = Assignment('x', BinaryExpression(Variable('x'), '+', Literal(1)));
    evaluator.evaluate(stmt);
    expect(evaluator.variables['x'], 6);
  });

  test('Evaluator should evaluate expressions', () {
    Evaluator evaluator = Evaluator();
    expect(evaluator.evaluateExpression(Literal(5)), 5);
    evaluator.variables['x'] = 5;
    expect(evaluator.evaluateExpression(Variable('x')), 5);
    expect(evaluator.evaluateExpression(BinaryExpression(Literal(2), '+', Literal(3))), 5);
    expect(evaluator.evaluateExpression(BinaryExpression(Literal(6), '-', Literal(1))), 5);
    expect(evaluator.evaluateExpression(BinaryExpression(Literal(2), '*', Literal(3))), 6);
    expect(evaluator.evaluateExpression(BinaryExpression(Literal(6), '/', Literal(2))), 3);
    expect(evaluator.evaluateExpression(UnaryExpression('-', Literal(5))), -5);
  });
}
