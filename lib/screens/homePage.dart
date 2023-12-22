import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_planner/responsive/responsive.dart';
import 'package:travel_planner/widgets/toggleIcon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool lightMode = false;
  String travelPrompt = '';
  String travelPlan = '';

  late DateTime _focusedDay1;
  late DateTime _focusedDay2;
  late TextEditingController destinationController;
  late FocusNode destinationFocusNode;
  late DateTime selectedDay1;
  late TextEditingController startDateController;
  late FocusNode startDateFocusNode;
  late DateTime selectedDay2;
  late TextEditingController endDateController;
  late FocusNode endDateFocusNode;
  late TextEditingController budgetController;
  late FocusNode budgetFocusNode;

  @override
  void initState() {
    _focusedDay1 = DateTime.now();
    _focusedDay2 = DateTime.now();
    destinationController = TextEditingController();
    destinationFocusNode = FocusNode();
    startDateController = TextEditingController();
    startDateFocusNode = FocusNode();
    endDateController = TextEditingController();
    endDateFocusNode = FocusNode();
    budgetController = TextEditingController();
    budgetFocusNode = FocusNode();
    selectedDay1 = DateTime.now();
    selectedDay2 = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF232C31),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            Container(
              width: 100,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xFF1D2429),
              ),
            ),
          Expanded(
            flex: 8,
            child: Align(
              alignment: AlignmentDirectional(0, -1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF1D2429),
                        ),
                        child: Form(
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(4, 16, 4, 70),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                ))
                                  Container(
                                    width: 400,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1D2429),
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Trip Planner',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ToggleIcon(
                                          onPressed: () async {
                                            setState(() {
                                              lightMode = !lightMode;
                                            });
                                          },
                                          value: lightMode,
                                          offIcon: Icon(
                                            Icons.nights_stay_sharp,
                                            color: Color(0xFFFFFFFF),
                                            size: 24,
                                          ),
                                          onIcon: Icon(
                                            Icons.lightbulb_outlined,
                                            color: Color(0xFF0B191E),
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    'Fill out the information below in order to plan the trip',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF658593),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 16),
                                  child: TextFormField(
                                    controller: destinationController,
                                    focusNode: destinationFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Destination',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF658593),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF293238),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4B986C),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFff5963),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFff5963),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 24, 0, 24),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 4),
                                  child: Text(
                                    'Enter the dates for your trip',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFEEEEEE),
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Text(
                                    'Start Date',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                TableCalendar(
                                  focusedDay: _focusedDay1,
                                  firstDay: DateTime.utc(2020, 12, 31),
                                  lastDay: DateTime.utc(2030, 12, 31),
                                  calendarFormat: CalendarFormat.week,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  rowHeight: 64,
                                  daysOfWeekVisible: true,
                                  selectedDayPredicate: (day) {
                                    return isSameDay(selectedDay1, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    _focusedDay1 = focusedDay;
                                    selectedDay1 = selectedDay;
                                    startDateController.text =
                                        DateFormat('yMMMd').format(selectedDay);
                                    print(startDateController.text);
                                    setState(() {});
                                  },
                                  headerStyle: HeaderStyle(
                                    titleCentered: true,
                                    formatButtonVisible: false,
                                    titleTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: Color(0xFF658593),
                                      size: 20,
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_right,
                                      color: Color(0xFF658593),
                                      size: 20,
                                    ),
                                  ),
                                  daysOfWeekStyle: DaysOfWeekStyle(
                                    weekdayStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    weekendStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  calendarStyle: CalendarStyle(
                                    weekendTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    defaultTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    todayTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    outsideTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                    selectedTextStyle: TextStyle(
                                      color: Color(0xFF658593),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    selectedDecoration: BoxDecoration(
                                      color: Color(0xFF7CFFB2),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: TextFormField(
                                    controller: startDateController,
                                    focusNode: startDateFocusNode,
                                    autofocus: true,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Start date',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF658593),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF293238),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4b986c),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFff5963),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFff5963),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 24, 0, 24),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Text(
                                    'End Date',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                TableCalendar(
                                  focusedDay: _focusedDay2,
                                  firstDay: DateTime.utc(2020, 12, 31),
                                  lastDay: DateTime.utc(2030, 12, 31),
                                  calendarFormat: CalendarFormat.week,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  rowHeight: 64,
                                  daysOfWeekVisible: true,
                                  selectedDayPredicate: (day) {
                                    return isSameDay(selectedDay2, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    _focusedDay2 = focusedDay;
                                    selectedDay2 = selectedDay;
                                    endDateController.text =
                                        DateFormat('yMMMd').format(selectedDay);
                                    print(endDateController.text);
                                    setState(() {});
                                  },
                                  headerStyle: HeaderStyle(
                                    titleCentered: true,
                                    formatButtonVisible: false,
                                    titleTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: Color(0xFF658593),
                                      size: 20,
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_right,
                                      color: Color(0xFF658593),
                                      size: 20,
                                    ),
                                  ),
                                  daysOfWeekStyle: DaysOfWeekStyle(
                                    weekdayStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    weekendStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  calendarStyle: CalendarStyle(
                                    weekendTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    defaultTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    todayTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    outsideTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                    selectedTextStyle: TextStyle(
                                      color: Color(0xFF658593),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    selectedDecoration: BoxDecoration(
                                      color: Color(0xFF7CFFB2),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: TextFormField(
                                    controller: endDateController,
                                    focusNode: endDateFocusNode,
                                    autofocus: true,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'End date',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF658593),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF293238),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4b986c),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFff5963),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFff5963),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 24, 0, 24),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
