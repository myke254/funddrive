enum PaymentMethod {
  paypal('PayPal', 'assets/paypal'),
  mpesa('M-Pesa', 'assets/mpesa'),
  visa('Visa', 'assets/visa'),
  mastercard('Mastercard', 'assets/mastercard');

  final String label;
  final String assetPrefix; // reserved for future icons/assets
  const PaymentMethod(this.label, this.assetPrefix);
}

