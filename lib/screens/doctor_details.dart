
import 'package:doc/componemts/button.dart';
import 'package:doc/componemts/custom_appBar.dart';
import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  
  //for favorite button
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Details du medecin',
        icon:   Icon(Icons.arrow_back_ios),    
        actions: [
          //favorite button
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            }, 
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            )
            )
        ], route: '',  
       ),
       body: SafeArea(
        child: Column(
          children: <Widget>[
            //build doctor avatar and intro here
            AboutDoctor(),
            DetailsBody(),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Button(
                width: double.infinity, 
                title: 'Liste des rdv', 
                disable: false, 
                onPressed: () {
                  //navigate to booking page
                  Navigator.of(context).pushNamed('booking_page');
                  },
                ),
              )
          ],
        )),
    );
  }
}


class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/profile1.jpeg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          Text('Dr Hamidou kassogue',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              'A l hopital Gabriel Toure',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          //doctor exp, patient and rating
          DoctorInfo(),
          Config.spaceBig,
          Text(
            'A propos du medecin',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Config.spaceSmall,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}


class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
      children: <Widget>[
        InfoCard(
          label: 'Patients', 
          value: '100',
        ),
        SizedBox(width: 15,),
        InfoCard(
          label: 'Experiences', 
          value: '10 ans',
        ),
        SizedBox(width: 15,),
        InfoCard(
          label: 'Rating', 
          value: '4.6',
        )
      ],
    );
  }
}


class InfoCard extends StatelessWidget {
   InfoCard({super.key, required this.label, required this.value});

final String label;
final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Config.primaryColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Column(
              children: <Widget>[
                Text(
                  'Patients',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                ),
                SizedBox(height: 10),
                Text(
                  '109',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ],
            ),
          )         
          );
  }
}