import 'dart:developer';
import 'package:contacts_app_kec/Nav_Home.dart';
import 'package:contacts_app_kec/Shared/design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calander_db_service.dart';

class CalanderEventList extends StatefulWidget {
  const CalanderEventList({super.key});

  @override
  State<CalanderEventList> createState() => _CalanderEventListState();
}

class _CalanderEventListState extends State<CalanderEventList> {
  List<String> _selectedEvents = [];
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final dateEvent = Provider.of<List<CalanderDate>>(context);

    List<String> getEventsForDay(DateTime day) {
      List<String> returnlist = [];
      for (var element in dateEvent) {
        if (element.date.toDate().year == day.year &&
            element.date.toDate().month == day.month &&
            element.date.toDate().day == day.day) {
          for (var e in element.event) {
            returnlist.add(e);
          }
          // returnlist.add(element.event.toString());
        }
      }
      return returnlist;
    }

    void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
      log(selectedDay.toString());
      log(focusedDay.toString());
      if (!isSameDay(_selectedDay, selectedDay)) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        setState(() {
          _selectedEvents = getEventsForDay(selectedDay);
        });
      }
      // log(_selectedEvents.toString());
    }

    var h = Get.height;
    return Scaffold(
        backgroundColor: kPrimaryLightColor,
        body: Container(
          margin:
              EdgeInsets.symmetric(vertical: h * 0.04, horizontal: h * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: kPrimaryColor,
                      size: h * 0.037,
                    ),
                    onPressed: () {
                      Get.offAll(const NavigationHome());
                    },
                  ),
                  const Expanded(
                    flex: 13,
                    child: Text(""),
                  ),
                  const Text(
                    "Academic Calender",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.calendar_month,
                    color: kPrimaryColor,
                  )
                ],
              ),
              TableCalendar(
                rowHeight: h * 0.065,
                calendarStyle: CalendarStyle(
                    markerDecoration: const BoxDecoration(
                        shape: BoxShape.rectangle, color: kPrimaryColor),
                    tableBorder: const TableBorder(
                        bottom: BorderSide(
                            color: kPrimaryColor,
                            style: BorderStyle.solid,
                            width: 3)),
                    selectedDecoration: const BoxDecoration(
                        color: kPrimaryMediumColor, shape: BoxShape.circle),
                    todayTextStyle: const TextStyle(color: kPrimaryColor),
                    todayDecoration: BoxDecoration(
                        border: Border.all(
                            color: kPrimaryColor,
                            style: BorderStyle.solid,
                            width: 1),
                        shape: BoxShape.circle),
                    holidayTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    defaultTextStyle: const TextStyle(
                      color: kPrimaryColor,
                    )),
                daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.black),
                    weekendStyle: TextStyle(color: Colors.redAccent)),
                headerStyle: HeaderStyle(
                  headerPadding: EdgeInsets.all(h * 0.01),
                  headerMargin: EdgeInsets.only(bottom: h * 0.02),
                  formatButtonVisible: false,
                  titleTextStyle:
                      TextStyle(color: Colors.white, fontSize: h * 0.025),
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: h * 0.037,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: h * 0.037,
                  ),
                ),
                firstDay: DateTime.utc(2021, 06, 01),
                lastDay: DateTime.utc(2023, 02, 28),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: onDaySelected,
                eventLoader: (day) {
                  return getEventsForDay(day);
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                "Events",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: h * 0.02),
              ),
              getEventsForDay(_selectedDay).isEmpty
                  ? const Expanded(
                      child: Center(child: Text("No Events on this day")))
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _selectedEvents.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.01,
                                vertical: h * 0.008,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                title: Text(_selectedEvents[index].toString()),
                              ),
                            );
                          })),
                    ),
            ],
          ),
        ));
  }
}
