abstract class Statement {}

class VariableDeclaration extends Statement {
  final String name;
  final Expression expression;
  VariableDeclaration(this.name, this.expression);
}

class PrintStatement extends Statement {
  final String name;
  PrintStatement(this.name);
}

class Assignment extends Statement {
  final String name;
  final Expression expression;
  Assignment(this.name, this.expression);
}

abstract class Expression {}

class Literal extends Expression {
  final dynamic value;
  Literal(this.value);
}

class Variable extends Expression {
  final String name;
  Variable(this.name);
}

class BinaryExpression extends Expression {
  final Expression left;
  final String operator;
  final Expression right;
  BinaryExpression(this.left, this.operator, this.right);
}

class UnaryExpression extends Expression {
  final String operator;
  final Expression right;
  UnaryExpression(this.operator, this.right);
}
