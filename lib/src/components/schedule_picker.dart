import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/src/utils/colors.dart';

class SchedulePicker extends StatefulWidget {
  @override
  State<SchedulePicker> createState() => _SchedulePickerState();
}

class _SchedulePickerState extends State<SchedulePicker> {
  int selectedDateIndex = 0;
  int? selectedTimeIndex;

  final List<String> dates = ["17 Nov", "18 Nov", "19 Nov", "20 Nov", "21 Nov"];
  final List<String> times = [
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(dates.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDateIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color:
                        selectedDateIndex == index ? suratBlue : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selectedDateIndex == index
                          ? suratBlue
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        dates[index].split(' ')[0], // Day
                        style: TextStyle(
                          color: selectedDateIndex == index
                              ? Colors.white
                              : suratBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        dates[index].split(' ')[1], // Month
                        style: TextStyle(
                          color: selectedDateIndex == index
                              ? Colors.white
                              : suratBlue,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 16),
        // Time selection grid
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(times.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTimeIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: selectedTimeIndex == index ? suratBlue : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selectedTimeIndex == index
                        ? suratBlue
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  times[index],
                  style: TextStyle(
                    color:
                        selectedTimeIndex == index ? Colors.white : suratBlue,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
