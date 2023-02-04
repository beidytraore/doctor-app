import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
 DoctorCard({super.key, required this.route});

 final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(width: Config.widthSize * 0.33,
              child: Image.asset('assets/profile1.jpeg',fit: BoxFit.fill),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Dr Traore',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Optomologie',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ), 
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Icon(Icons.star_border,color: Colors.yellow,size: 10,),
                        Spacer(flex:1),
                        Text('4.5'),
                        Spacer(flex:1),
                        Text('historique'),
                        Spacer(flex:1),
                        Text('20'),
                        Spacer(flex:1),
                      ]
                    )
                  ],
                ),
                )
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(route);
        }, //redirect to doctor details
      )
    );
  }
}