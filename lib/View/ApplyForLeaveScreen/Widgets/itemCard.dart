import 'package:flutter/material.dart';

import '../../../res/CommonWidgets/apptext.dart';


class ItemCard extends StatelessWidget {
  final String leaveType, status, reason, date;
  final Color? statusBgColor, leaveTypeColor, statusColor, reasonColor;

  const ItemCard({
    Key? key,
    required this.leaveType,
    required this.status,
    required this.reason,
    required this.date,
    this.statusBgColor,
    this.leaveTypeColor,
    this.statusColor,
    this.reasonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: leaveType,
                textColor: leaveTypeColor ?? Colors.deepOrangeAccent,
              ),
              Container(
                height: 20,
                width: 55,
                decoration: BoxDecoration(
                  color: statusBgColor ?? Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 20,
                color: Colors.deepPurple,
              ),
              const SizedBox(width: 5),
              Text(
                date, // Display date
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Text(
            reason,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
