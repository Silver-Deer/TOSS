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
    String value = json['accountNumber'].toString();
    accountNumber = value.length == 11
        ? '${value.substring(0, 3)}-${value.substring(3, 7)}-${value.substring(7, 11)}'
        : '${value.substring(0, 2)}-${value.substring(2, 6)}-${value.substring(6, 10)}';
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
