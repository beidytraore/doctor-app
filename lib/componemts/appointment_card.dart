import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //Row here
              Row(
                children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile1.jpeg'),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dr Amadou Traore',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 2,),
                  Text('Dentiste',
                  style: TextStyle(color: Colors.black),
                  )
                ],
              )
                ],
              ),
              Config.spaceSmall,
              //Schedule info here
              ScheduleCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Annule',
                        style: TextStyle(color: Colors.white),
                      ),
                      )
                  ),
                  SizedBox(width: 20),
                   Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {},
                      child: Text(
                        'ok',
                        style: TextStyle(color: Colors.white),
                      ),
                      )
                  )
                ]
              )
            ],
          ),
          ),
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
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding:const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:const <Widget>[
          const Icon(Icons.calendar_today,
          color: Colors.white,
          size: 15,
          ),
          SizedBox(width: 5,),
          Text(
            'Lundi, 14/4/2023',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm,
          color: Colors.white,
          size: 17,
          ),
          SizedBox(width: 5,),
      Flexible(
        child: Text(
          '2:00 PM',
          style: TextStyle(color:Colors.white),
        ))
        ],
      )
    );
  }
}