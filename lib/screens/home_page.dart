import 'package:doc/componemts/appointment_card.dart';
import 'package:doc/componemts/doctor_card.dart';
import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<Map<String, dynamic>> medCat = [
  {
  "icon": FontAwesomeIcons.userDoctor,
  "category":"General",
  },
  {
  "icon": FontAwesomeIcons.heartPulse,
  "category":"Cardiologie",
  },
  {
  "icon": FontAwesomeIcons.lungs,
  "category":"Respiratoire",
  },
  {
  "icon": FontAwesomeIcons.hand,
  "category":"Dermatologue",
  },
  {
  "icon": FontAwesomeIcons.personPregnant,
  "category":"Gynecologue",
  },
  {
  "icon": FontAwesomeIcons.teeth,
  "category":"Optomologue",
  }
];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Beydi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profile1.jpeg'),
                      ),
                    )
                  ],
                ),
                Config.spaceSmall,
                Text('Categories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length,
                       (index) {
                        return Card(
                          margin: EdgeInsets.only(right: 20),
                          color: Config.primaryColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FaIcon(
                                  medCat[index]['icon'],
                                  color: Colors.white,
                                ),
                                Text(
                                  medCat[index]['categorie'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )
                                )
                              ],
                            ),
                            ),
                        );
                       }),
                  ),
                ),
                Config.spaceSmall,
                Text(
                  'Liste des rendez-vous',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                //display appointment card here
                  AppointmentCard(),
                 Config.spaceSmall,
                 Text(
                  'Les meilleurs medecins',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Column(
                  children: List.generate(10, (index) {
                    return DoctorCard(
                      route: 'doc_details',
                    );
                  }),
                )
              ],
            ),
          )),
      ),
    );
  }
}