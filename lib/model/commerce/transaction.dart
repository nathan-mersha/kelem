/// Defines transaction model
class Transaction {
  /// Defines key values to extract from a map
  static const String TRANSACTION_ID = "transactionId";
  static const String FROM_WALLET_ID = "fromWalletId";
  static const String TO_WALLET_ID = "toWalletId";
  static const String REASON = "reason";
  static const String AMOUNT = "amount";
  static const String TRANSACTION_FEE = "transactionFee";
  static const String STATUS = "status";
  static const String ANONYMOUS = "anonymous";
  static const String EVENT_ID = "eventId";
  static const String FAILED_REASON = "failedReason";

  String transactionId;
  String fromWalletId;
  String toWalletId;
  String reason;
  double amount;
  double transactionFee;
  String status;
  bool anonymous;
  String eventId;
  String failedReason;

  Transaction(
      {this.transactionId,
      this.fromWalletId,
      this.toWalletId,
      this.reason,
      this.amount,
      this.transactionFee,
      this.status,
      this.anonymous,
      this.eventId,
      this.failedReason});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Transaction transaction) {
    return {
      TRANSACTION_ID: transaction.transactionId,
      FROM_WALLET_ID: transaction.fromWalletId,
      TO_WALLET_ID: transaction.toWalletId,
      REASON: transaction.reason,
      AMOUNT: transaction.amount,
      TRANSACTION_FEE: transaction.transactionFee,
      STATUS: transaction.status,
      ANONYMOUS: transaction.anonymous,
      EVENT_ID: transaction.eventId,
      FAILED_REASON: transaction.failedReason,
    };
  }

  /// Converts Map to Model
  static Transaction toModel(Map<String, dynamic> map) {
    return Transaction(
      transactionId: map[TRANSACTION_ID],
      fromWalletId: map[FROM_WALLET_ID],
      toWalletId: map[TO_WALLET_ID],
      reason: map[REASON],
      amount: map[AMOUNT],
      transactionFee: map[TRANSACTION_FEE],
      status: map[STATUS],
      anonymous: map[ANONYMOUS],
      eventId: map[EVENT_ID],
      failedReason: map[FAILED_REASON],
    );
  }

  /// Changes List of Map to List of Model
  static List<Transaction> toModelList(List<Map<String, dynamic>> maps) {
    List<Transaction> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Transaction> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Transaction model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
