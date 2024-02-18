
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/LeaveController/leave_controller.dart';
import '../Widgets/itemCard.dart';


class TabContent1 extends StatelessWidget {
  final LeaveController leaveController = Get.put(LeaveController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => leaveController.leaveList.isEmpty?
          Container(color:Colors.white,child: Image.asset('assets/NoRecordsFound.png')):
          ListView.builder(
        itemCount: leaveController.leaveList.length,
        itemBuilder: (context, index) {
          final leaveData = leaveController.leaveList[index];
          return ItemCard(
            date: leaveData.dateRange, // Assuming dateRange is a String
            leaveType: leaveData.type,
            status: 'pending',
            reason: leaveData.reason,
            statusBgColor: Colors.orange.withOpacity(.15),
            statusColor: Colors.orange,
          );
        },
      ),
    );
  }
}

