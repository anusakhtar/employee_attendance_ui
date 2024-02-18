import 'package:flutter/material.dart';

import '../Widgets/itemCard.dart';

class TabContent3 extends StatefulWidget {
  const TabContent3({super.key});

  @override
  State<TabContent3> createState() => _TabContent3State();
}

class _TabContent3State extends State<TabContent3> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return ItemCard(
            date: 'Apr 10,2023 - Apr 15,2023',
            leaveType: 'Casual',
            leaveTypeColor: Colors.teal,
            status: 'Declined',
            statusBgColor: Colors.redAccent.withOpacity(.15),
            statusColor: Colors.redAccent,
            reason: "i will be travaling for my sister's wedding.i want to in form "
                "you that before I leave.I'll complete my ongoing projectand deliverables."
                "Also,while i'm away my team will offer the requisite support(if and whenever needed)",
          );
        });
  }
}
