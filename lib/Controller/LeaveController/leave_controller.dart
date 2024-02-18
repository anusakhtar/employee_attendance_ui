import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../View/ApplyForLeaveScreen/apply_for_leave_screen.dart';
import '../../ViewModel/LeaveData.dart';
import '../../res/routes/route_name.dart';

class LeaveController extends GetxController {
  final TextEditingController reasonController = TextEditingController();
  RxString? selectedType;
  var reason = ''.obs;
  var selectedButton = 0.obs;
  var selectedDateRange = <DateTime>[].obs;
  var leaveList = <LeaveData>[].obs;
  RxDouble totalLeaves = 50.0.obs;
  RxDouble remainingLeaves = 50.0.obs;
  RxDouble pendingLeaves = 0.0.obs;
  var selectedTabIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  void applyLeave() {
    if (remainingLeaves.value > 0) {
      remainingLeaves.value--;
      pendingLeaves.value++;
      update();
    }
  }

  void selectButton(int? index) {
    selectedButton.value = index ?? 0;

    if (selectedButton.value == 1) {
      selectedType = 'Sick'.obs;
    } else if (selectedButton.value == 2) {
      selectedType = 'Casual'.obs;
    } else {
      selectedType = null;
    }
  }

  void setSelectedDateRange(List<DateTime?> dateRange) {
    if (dateRange.isNotEmpty) {
      List<DateTime> selectedDates = dateRange.whereType<DateTime>().toList();

      if (selectedDates.length == 1) {
        selectedDateRange.assignAll([selectedDates.first]);
      } else if (selectedDates.length > 1) {
        selectedDateRange.assignAll([selectedDates.first, selectedDates.last]);
      }
    } else {
      selectedDateRange.clear();
    }
  }

  void updateReason(String value) {
    reason.value = value;
  }

  void saveData() {
    List<DateTime> dateRange = selectedDateRange.whereType<DateTime>().toList();

    if (reason.isEmpty ||
        dateRange.isEmpty ||
        selectedType == null ||
        selectedType!.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields.',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      selectedButton.value = 0;
      return;
    }

    String formattedDateRange = formatDateRange(selectedDateRange);
    String selectedTypeValue = selectedType?.value ?? '';

    LeaveData leaveData = LeaveData(
      type: selectedTypeValue,
      dateRange: formattedDateRange,
      reason: reason.value,
    );

    print('Leave Data Type: ${leaveData.type}');
    print('Leave Data Date Range: ${leaveData.dateRange}');
    print('Leave Data reason: ${leaveData.reason}');

    leaveList.add(leaveData);
    applyLeave();

    selectedButton.value = 0;
    reason.value = '';
    selectedDateRange.clear();
    reasonController.clear();
    Get.to(() => ApplyForLeaveScreen());

    Get.snackbar(
      'Success',
      'Leave request submitted successfully.',
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  String formatDateRange(List<DateTime?> dateRange) {
    if (dateRange.isEmpty) {
      return 'No date selected';
    } else if (dateRange.length == 1) {
      return _formatDate(dateRange.first!);
    } else {
      return '${_formatDate(dateRange.first!)} to ${_formatDate(dateRange.last!)}';
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }
}
