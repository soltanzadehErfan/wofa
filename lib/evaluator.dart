import 'ast.dart';

class Evaluator {
  final Map<String, dynamic> variables = {};

  void evaluate(Statement stmt) {
    if (stmt is VariableDeclaration) {
      variables[stmt.name] = evaluateExpression(stmt.expression);
    } else if (stmt is PrintStatement) {
      print(variables[stmt.name]);
    } else if (stmt is Assignment) {
      variables[stmt.name] = evaluateExpression(stmt.expression);
    }
  }

  dynamic evaluateExpression(Expression expr) {
    if (expr is Literal) {
      return expr.value;
    } else if (expr is Variable) {
      return variables[expr.name];
    } else if (expr is BinaryExpression) {
      var left = evaluateExpression(expr.left);
      var right = evaluateExpression(expr.right);
      switch (expr.operator) {
        case '+':
          return left + right;
        case '-':
          return left - right;
        case '*':
          return left * right;
        case '/':
          return left / right;
      }
    } else if (expr is UnaryExpression) {
      var right = evaluateExpression(expr.right);
      switch (expr.operator) {
        case '-':
          return -right;
      }
    }
    return null;
  }
}
