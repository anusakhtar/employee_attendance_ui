import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/LeaveController/leave_controller.dart';
import 'Widgets/red_star_heading.dart';

class NewLeave extends StatefulWidget {
  const NewLeave({Key? key}) : super(key: key);

  @override
  State<NewLeave> createState() => _NewLeaveState();
}

class _NewLeaveState extends State<NewLeave> {
  final LeaveController leaveController = Get.put(LeaveController());

  @override
  Widget build(BuildContext context) {
    var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).hintColor.withOpacity(0.7),
      ),
    );
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).hintColor.withOpacity(0.5),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Leave'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Text(
                "\u2022 Please choose the day and specify the type and duration of the leave. ",
                style: Theme.of(context).textTheme.titleLarge!.merge(
                  const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const redStarHeading(title: "Type"),
              const SizedBox(height: 5),
            Obx(() => SizedBox(
              height: 60,
              child: DropdownButtonFormField<int>(
                value: leaveController.selectedButton.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: BorderRadius.circular(10),
                decoration: InputDecoration(
                  hintText: 'Select Leave Type',
                  hintStyle: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                dropdownColor: Colors.white,
                items: [
                  DropdownMenuItem<int>(
                    value: 0, // Change the value to null
                    child: Text(
                      "Select Leave Type",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: leaveController.selectedButton.value == 0 // Check if selectedType is null
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).hintColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text(
                      "Sick",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: leaveController.selectedButton.value == 1
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).hintColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text(
                      "Casual",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: leaveController.selectedButton.value == 2
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).hintColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
                onChanged: leaveController.selectButton,
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.deepPurple,
                ),
              ),
            ),),
            const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const redStarHeading(title: "Date"),
                      Obx(() {
                        final selectedDateRange = leaveController.selectedDateRange;
                        if (selectedDateRange.isEmpty) {
                          return const Text(
                            'No date selected',
                            style: TextStyle(fontSize: 12),
                          );
                        } else {
                          return Text(
                            leaveController.formatDateRange(selectedDateRange),
                            style: const TextStyle(fontSize: 12),
                          );
                        }
                      }),
                    ],
                  ),
                  Obx(() =>CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      calendarType: CalendarDatePicker2Type.range,
                    ),
                    value: leaveController.selectedDateRange,
                    onValueChanged: leaveController.setSelectedDateRange,
                  ), ),

                ],
              ),
                  const redStarHeading(title:"Reason"),
                  TextFormField(
                    controller: leaveController.reasonController,
                    onChanged: leaveController.updateReason,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 14,
                    ),
                    validator: (input) =>
                    input!.isEmpty ? "Enter Reason" : null,
                    keyboardType: TextInputType.multiline,
                    keyboardAppearance: Theme.of(context).brightness,
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                      hintStyle: TextStyle(
                        color:
                        Theme.of(context).hintColor.withOpacity(0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: const EdgeInsets.all(12),
                      hintText: "Reason",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                          Theme.of(context).hintColor.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: focusedBorder,
                      enabledBorder: enabledBorder,
                    ),
                  ),
                  const SizedBox(height: 15),

                  BouncingWidget(
                    duration: const Duration(milliseconds: 80),
                    scaleFactor: 0.6,
                    onPressed: leaveController.saveData,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 4,
                      margin: EdgeInsets.zero,
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 19),
                        child: Center(
                          child: Text(
                            "Submit",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!.merge(
                              const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );

  }
}
