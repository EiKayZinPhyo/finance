class ExpenseClass {
  ExpenseClass({
    required this.title,
    required this.amount,
    required this.label,
    required this.createdAt,
  });

  final String title;
  final double amount;
  final String label;
  final dynamic createdAt;
}
