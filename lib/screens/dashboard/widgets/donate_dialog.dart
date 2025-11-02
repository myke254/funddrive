import 'package:flutter/material.dart';
import 'package:funddrive/models/fund.dart';
import 'package:funddrive/screens/dashboard/widgets/donate_now_button.dart';

import '../../../widgets/text_input_field.dart';

class DonateDialog extends StatefulWidget {
  const DonateDialog({super.key, required Fund fund}) : _fund = fund;

  final Fund _fund;

  @override
  State<DonateDialog> createState() => _DonateDialogState();
}

class _DonateDialogState extends State<DonateDialog> {
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(type: PaymentType.card, title: "Card", icon: Icons.payment),
    PaymentMethod(
      type: PaymentType.mpesa,
      title: "M-Pesa",
      icon: Icons.mobile_friendly,
    ),
  ];

  PaymentType selectedPaymentMethod = PaymentType.card;
  PaymentType? hoveredPaymentType;

  void switchPaymentMethod(PaymentType paymentType) {
    if (paymentType == selectedPaymentMethod) {
      return;
    }
    setState(() {
      selectedPaymentMethod = paymentType;
    });
  }

  void hover(bool showHover, PaymentType paymentType) {
    if (showHover) {
      hoveredPaymentType = paymentType;
    } else {
      hoveredPaymentType = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: theme.dividerColor, width: .5),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text('Donate to: ', style: theme.textTheme.headlineMedium),
              SelectableText(
                maxLines: 1,
                widget._fund.title,
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),

          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
        ],
      ),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(widget._fund.description),
            SizedBox(height: 10),
            Divider(color: theme.dividerColor, thickness: .4),
            SizedBox(height: 10),
            Text('Amount (${widget._fund.currencyCode})'),
            SizedBox(height: 5),
            TextInputField(keyboardType: TextInputType.number),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  paymentMethods
                      .map(
                        (method) => InkWell(
                          onHover: (value) {
                            hover(value, method.type);
                          },
                          onTap: () => switchPaymentMethod(method.type),
                          child: Container(
                            width: 170,
                            height: 70,
                            decoration: BoxDecoration(
                              color:
                                  hoveredPaymentType == method.type
                                      ? theme.primaryColor
                                      : theme.canvasColor,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                width:
                                    selectedPaymentMethod == method.type
                                        ? 2
                                        : .5,
                                color:
                                    selectedPaymentMethod == method.type
                                        ? theme.primaryColor
                                        : theme.dividerColor,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  method.icon,
                                  color:
                                      hoveredPaymentType == method.type
                                          ? theme.canvasColor
                                          : theme.textTheme.bodyMedium?.color,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  method.title,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color:
                                        hoveredPaymentType == method.type
                                            ? theme.canvasColor
                                            : theme.textTheme.bodyMedium?.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 15),
            if (selectedPaymentMethod == PaymentType.card)
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.dividerColor, width: .5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name on Card'),
                    SizedBox(height: 7),
                    TextInputField(hintText: 'John Doe'),
                    SizedBox(height: 10),
                    Text('Card Number'),
                    SizedBox(height: 7),
                    TextInputField(
                      hintText: '•••• •••• •••• ••••',
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Expiry'),
                              SizedBox(height: 7),
                              TextInputField(hintText: 'MM/YY'),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text('CVV'),
                              SizedBox(height: 7),
                              TextInputField(
                                hintText: '123',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (selectedPaymentMethod == PaymentType.mpesa)
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('M-pesa Phone Number'),
                    SizedBox(height: 7),
                    TextInputField(
                      hintText: 'e.g. 254712345678',
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),

            SizedBox(height: 12),
            CompleteDonateButton(
              buttonText: "Donate ${widget._fund.currencyCode} 50.0",
              fund: widget._fund,
              amount: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

enum PaymentType { card, mpesa }

class PaymentMethod {
  final PaymentType type;
  final String title;
  final IconData icon;

  PaymentMethod({required this.type, required this.title, required this.icon});
}
