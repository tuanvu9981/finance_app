class Transaction {
  String? imageUrl;
  String? name;
  String? time;
  String? fee;
  bool? buy;

  Transaction({
    this.imageUrl,
    this.name,
    this.time,
    this.fee,
    this.buy,
  });
}

final transactions = <Transaction>[
  Transaction(
    imageUrl: 'assets/images/salary.jpg',
    name: 'April salary',
    time: '2023 April 20th',
    fee: '2000.00 \$',
    buy: false,
  ),
  Transaction(
    imageUrl: 'assets/images/hamburger.jpg',
    name: 'Hamburger',
    time: '2023 April 20th',
    fee: '8.50 \$',
    buy: true,
  ),
  Transaction(
    imageUrl: 'assets/images/tra-sen-vang.png',
    name: 'Highland coffee',
    time: '2023 April 22th',
    fee: '3.25 \$',
    buy: true,
  ),
  Transaction(
    imageUrl: 'assets/images/salary.jpg',
    name: 'Scholarship',
    time: '2023 April 22th',
    fee: '850.00 \$',
    buy: false,
  ),
  Transaction(
    imageUrl: 'assets/images/beef-wellington.jpg',
    name: 'Beef Wellington',
    time: '2023 April 20th',
    fee: '10.25 \$',
    buy: true,
  ),
];

final topTransactions = transactions.where((e) => e.buy == true).toList();
