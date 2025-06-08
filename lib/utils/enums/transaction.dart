enum Acquirer { gopay }

enum PaymentType { qris }

enum TransactionStatus {
  authorize,
  capture,
  settlement,
  deny,
  pending,
  cancel,
  refund,
  partialRefund,
  chargeback,
  partialChargeback,
  expire,
  failure
}