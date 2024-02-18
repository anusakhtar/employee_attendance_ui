import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Controller/AttendenceDetailController/attendence_detail_controller.dart';
import '../../res/CommonWidgets/apptext.dart';
import 'Widgets/monthlyreport.dart';
import 'Widgets/weeklyreport.dart';

class AttendenceDetailScreen extends StatelessWidget {
  AttendenceDetailScreen({super.key});
  final AttendanceDetailController attendanceController = Get.put(AttendanceDetailController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Today History',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .9,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_later_outlined),
                              AppText(
                                text: 'Started',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              AppText(
                                text:'Start your shift',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                textColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_later_outlined),
                              AppText(
                                text: 'Ended',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              AppText(
                                text:'End your shift',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                textColor: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_later_outlined),
                              AppText(
                                text: 'Shift Hrs',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              AppText(
                                text: '--/--',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                textColor: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .44,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Week Time",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "16 h 08 m",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 150,
                                  height: 5,
                                  child: LinearProgressIndicator(
                                    value: 0.35, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                    backgroundColor:
                                        Theme.of(context).primaryColorLight,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "23 May - 30 May",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .44,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Month Time",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "48 h 50 m",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 150,
                                  height: 5,
                                  child: LinearProgressIndicator(
                                    value: 0.35, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                    backgroundColor:
                                        Theme.of(context).primaryColorLight,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "23 May - 23 Jun",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ToggleSwitch(
                  minWidth: 155.0,
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Colors.deepPurple],
                    [Colors.deepPurple]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey.shade200,
                  inactiveFgColor: Colors.grey,
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: const ['Weekly', 'Monthly'],
                  radiusStyle: true,
                  onToggle: (index) {
                    attendanceController.updateSelectedTimeFrame(index!);
                  },
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Container(
                    width: 310,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            attendanceController.updateDate(-1);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                            ),
                            height: 57,
                            width: 40,
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 13,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await attendanceController.selectDate(
                                attendanceController.selectedDate.value, context);
                          },
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            size: 20,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Text(
                            ' ${attendanceController.formatDate(attendanceController.startDate.value)}'),
                        const Text(
                          '-',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                        Text(
                          attendanceController.formatDate(attendanceController.endDate.value),
                        ),
                        GestureDetector(
                          onTap: () {
                            attendanceController.updateDate(1);
                          },
                          child:  Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                            ),
                            height: 57,
                            width: 40,
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 13,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() => attendanceController.selectedTimeFrame.value == 1
                    ? WeeklyReport()
                    : MonthlyReport()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
