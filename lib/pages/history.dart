import 'package:flutter/material.dart';
import 'package:money_gram/constants/color.dart';
import 'package:money_gram/widgets/history_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, dynamic>> data = [
    {
      "receiver": "Athanas Shauritanga",
      "amount": 7000876.0,
      "status": "success",
      "receiverAccountNumber": "01J4567876",
      "receiverAccountName": "CRBD",
      "date": "23-09-2024"
    },
    {
      "receiver": "Doreen Masaki",
      "amount": 23809.90,
      "status": "failed",
      "receiverAccountNumber": "0767591660",
      "receiverAccountName": "VodaCom",
      "date": "23-11-2020"
    },
    {
      "receiver": "Salim Abu",
      "amount": 2300860.45,
      "status": "success",
      "receiverAccountNumber": "0655591660",
      "receiverAccountName": "Tigo Pesa",
      "date": "23-09-2022"
    },
    {
      "receiver": "Salim Abu",
      "amount": 2300860.45,
      "status": "pending",
      "receiverAccountNumber": "0655591660",
      "receiverAccountName": "Tigo Pesa",
      "date": "23-09-2022"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: MyAppColor.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: MyAppColor.lightGrey,
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "History",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 6),
              for (var item in data)
                HistoryCard(
                  receiver: item['receiver'],
                  amount: item['amount'],
                  receiverAccountName: item['receiverAccountName'],
                  receiverAccountNumber: item['receiverAccountNumber'],
                  date: item['date'],
                  status: item['status'],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
