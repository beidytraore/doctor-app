import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

//enum for appointment status
enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;//initial status
  Alignment _alignment = Alignment.centerLeft;
  
  List<dynamic> schedules = [
 {
  "doctor_name": "Richard tan",
  "doctor_profile": "assets/doctor_1.jpg",
  "category": "Dental",
  "status": FilterStatus.upcoming
 },
  {
  "doctor_name": "Michel zang",
  "doctor_profile": "assets/doctor_2.jpg",
  "category": "Gynecologue",
  "status": FilterStatus.complete
 },
  {
  "doctor_name": "Josephine mas",
  "doctor_profile": "assets/doctor_3.jpg",
  "category": "Generaliste",
  "status": FilterStatus.complete
 },
  {
  "doctor_name": "Mario jin",
  "doctor_profile": "assets/doctor_4.jpg",
  "category": "Dental",
  "status": FilterStatus.cancel
 }
];

  @override
  Widget build(BuildContext context) {
    //return filtered appointment
    //let s create schedule info
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.complete;
      //     break;   
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;    
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left:20,top:20, right:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'rdv calendrier',
                textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 18,
                fontWeight: FontWeight.bold,
               ),
              ),
              Config.spaceSmall,
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //this is the filter tabs
                        for(FilterStatus filterStatus in FilterStatus.values)
                          Expanded(
                            child: GestureDetector(
                              onTap: (() {
                                setState(() {
                                  if (filterStatus == FilterStatus.upcoming) {
                                    status = FilterStatus.upcoming;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus == FilterStatus.complete) {
                                    status = FilterStatus.complete;
                                    _alignment = Alignment.center;
                                  }else if (filterStatus == FilterStatus.cancel) {
                                    status = FilterStatus.cancel;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              }
                              ),
                              child: Center(
                                child: Text(filterStatus.name),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  AnimatedAlign(
                    alignment: _alignment, 
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Config.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          status.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),
                    )
                ],
              ),
            Config.spaceSmall,
             Expanded(
              child: ListView.builder(
                 itemCount: filteredSchedules.length,
                 itemBuilder: ((context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastELEMENT = filteredSchedules.length + 1 == index;
                return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: !isLastELEMENT
                         ? EdgeInsets.only(bottom: 20)
                         : EdgeInsets.zero,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                         CircleAvatar(
                          backgroundImage: AssetImage(_schedule['doctor_profile']),
                         ),
                         SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _schedule['doctor_name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          SizedBox(height: 5,),
                         Text(
                            _schedule['category'],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          ),  
                         ],
                        ),
                      ],
                      ),
                      SizedBox(height: 15,),
                      //schedule card
                    ScheduleCard(),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {}, 
                            child: Text(
                              'Annule',
                              style: TextStyle(color: Config.primaryColor),
                            )
                            )
                         ),
                         SizedBox(width: 20,),
                         Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Config.primaryColor,
                            ),
                            onPressed: () {}, 
                            child:  Text(
                              'mettre a jour le calendrier',
                              style: TextStyle(color: Config.primaryColor),
                            )
                            )
                          )
                      ],
                    )
                    ],
                  ),
                  ),         
                );
                }
                )
                )
                )
            ],
          )
          ),
      );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding:const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:const <Widget>[
         Icon(Icons.calendar_today,
          color: Config.primaryColor,
          size: 15,
          ),
          SizedBox(width: 5,),
          Text(
            'Lundi, 14/4/2023',
            style: TextStyle(color:Config.primaryColor),
          ),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm,
          color: Config.primaryColor,
          size: 17,
          ),
          SizedBox(width: 5,),
         Flexible(
           child: Text(
             '2:00 PM',
          style: TextStyle(color: Config.primaryColor),
        ))
        ],
      )
    );
  }
}