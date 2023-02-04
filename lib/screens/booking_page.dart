import 'package:doc/componemts/button.dart';
import 'package:doc/componemts/custom_appBar.dart';
import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';


class BookingPage extends StatefulWidget {
   BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  //declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isweekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'RDV',
        icon: Icon(Icons.arrow_back_ios), 
        actions: [], 
        route: '',
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                //display table calendar here
               _tableCalendar(),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 18,vertical: 25),
                child: Center(
                  child: Text(
                    'Selectionne le temps de la consultation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
                )
              ],
            ),
          ),
          _isweekend
              ? SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 30
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'weekend is not available, please select another date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )
                  )
                ),
              ) : SliverGrid(
                 delegate: SliverChildBuilderDelegate((context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        //when selected, update current index and set time selected to true
                        _currentIndex = index;
                        _timeSelected = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex == index
                          ? Colors.white
                          : Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: _currentIndex == index
                          ? Config.primaryColor
                          : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _currentIndex == index ? Colors.white : null,
                        )
                      )
                    ),
                  );
                 },
                 childCount: 8,
                 ), 
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5
                  )
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:10,vertical: 80),
                child: Button(
                  width: double.infinity,
                  title: 'Faire un rdv',
                  onPressed: () {
                    Navigator.of(context).pushNamed('success_booking');
                  },
                  disable: _timeSelected && _dateSelected ? false : true, 
                  ),
              ),
            )
        ],
      ),
    );
  }

  //table calendar
Widget _tableCalendar() {
 return TableCalendar(
      focusedDay: _focusDay, 
      firstDay: DateTime.now(), 
      lastDay: DateTime(2023,12,31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primaryColor,
          shape: BoxShape.circle
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mois',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          //check if weekend is delected
          if (selectedDay.weekday == 6 || selectedDay == 7)  {
            _isweekend = true;
            _timeSelected = false;
            _currentIndex = null;
          }else {
          _isweekend = false;
          }
        });
      }),
    );
    }
}

