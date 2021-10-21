class Account {
  String bankName = "";
  String accountName = "";
  String accountNumber = "";
  int money = 0;

  Account(
      {required this.bankName,
      required this.accountName,
      required this.accountNumber,
      required this.money});

  Account.fromJson(Map<String, dynamic> json) {
    bankName = json['bankName'];
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankName'] = this.bankName;
    data['accountName'] = this.accountName;
    data['accountNumber'] = this.accountNumber;
    data['money'] = this.money;
    return data;
  }
}
