import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:money_gram/constants/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Money Gram",
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  InkWell(
                    radius: 50,
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Icon(
                      HugeIcons.strokeRoundedCustomerSupport,
                      color: MyAppColor.primary,
                    ),
                  ),
                  const SizedBox(width: 24),
                  InkWell(
                    radius: 50,
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Icon(
                      HugeIcons.strokeRoundedNotification01,
                      color: MyAppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Send From"),
              TextFormField(
                decoration: InputDecoration(hintText: "Phone number"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Amount"),
              ),
              const SizedBox(height: 24),
              Divider(),
              const SizedBox(height: 24),
              const Text("Send To"),
            ],
          )),
        ),
      ),
    );
  }
}
