
import 'package:flutter/material.dart';

import '../Widgets/itemCard.dart';


class TabContent2 extends StatefulWidget {
  const TabContent2({super.key});

  @override
  State<TabContent2> createState() => _TabContent2State();
}

class _TabContent2State extends State<TabContent2> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context,index){
          return ItemCard(
            date: 'Apr 10,2023 - Apr 15,2023',
            leaveTypeColor:Colors.orange,
            leaveType: 'Sick',
            status: 'Approved',
            reason: 'I want to the hospital and the doctor confirmed that I have got[Covid-19]',
              statusBgColor:Colors.green.withOpacity(.15),
            statusColor: Colors.teal,
          );
        });

  }
}
