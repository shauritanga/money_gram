import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_gram/constants/color.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.receiver,
    required this.date,
    required this.status,
    required this.receiverAccountNumber,
    required this.receiverAccountName,
    required this.amount,
  });
  final String receiver;
  final String date;
  final String status;
  final String receiverAccountNumber;
  final String receiverAccountName;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final format =
        NumberFormat.currency(locale: "sw-TZ", symbol: "Tsh", decimalDigits: 2);
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: MyAppColor.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                receiver,
                style: TextStyle(color: MyAppColor.primary),
              ),
              Text(
                date,
                style: TextStyle(color: MyAppColor.primary),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                receiverAccountName,
                style: TextStyle(color: MyAppColor.primary),
              ),
              Text(
                status,
                style: TextStyle(
                  color: status == "success"
                      ? Colors.green
                      : status == "failed"
                          ? Colors.red
                          : MyAppColor.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                receiverAccountNumber.replaceAll(
                    receiverAccountNumber.substring(5), "*****"),
                style: TextStyle(color: MyAppColor.primary),
              ),
              Text(
                format.format(amount),
                style: TextStyle(color: MyAppColor.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
