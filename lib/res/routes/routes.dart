
import 'package:employee_attendance_ui/res/routes/route_name.dart';
import 'package:get/get.dart';

import '../../View/ApplyForLeaveScreen/apply_for_leave_screen.dart';
import '../../View/AttendenceDetailScreen/attendence_detail_screen.dart';
import '../../View/NewLeave/new_leave.dart';



class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.attendanceDetailScreen,
          page: () => AttendenceDetailScreen(),
          // duration: const Duration(milliseconds: 500),
          transition: Transition.circularReveal,
        ),
        GetPage(
          transition: Transition.circularReveal,
          name: RouteName.applyForLeaveScreen,
          page: () => const ApplyForLeaveScreen(),
        ),
        GetPage(
          transition: Transition.circularReveal,
          name: RouteName.newLeave,
          page: () => const NewLeave(),
        ),

      ];
}
