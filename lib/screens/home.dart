import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings?.arguments as Map;
    print(data);
    //set background
    String bgImg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blueAccent : Colors.indigo[700];
    Color? txtColor = data['isDayTime'] ? Colors.grey[800] : Colors.grey;
    String? text = data['isDayTime'] ? 'Good Morning! \n What Todoo Today?' : 'Good Evening! \n What Todoo Tonight?';
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,'/location');
                    setState((){
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: txtColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: txtColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: txtColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: txtColor,
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: txtColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0,),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,'/signin');
                  },
                  icon: Icon(
                    Icons.app_registration_rounded,
                    color: txtColor,
                  ),
                  label: Text(
                    'Sign In',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,'/login');
                  },
                  icon: Icon(
                    Icons.login,
                    color: txtColor,
                  ),
                  label: Text(
                    'Already have an account? Login.',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
