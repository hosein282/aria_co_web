import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/constants.dart';

List _isHovering = [false, false, false, false];



class Projects extends StatefulWidget {
  @override
  _FuturesPageState createState() => _FuturesPageState();
}

class _FuturesPageState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var menus = MenuList().menus;

  

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
                                    onPressed: (){},

          icon: Icon(Icons.account_balance_sharp),
          iconSize: 35,
          disabledColor: Colors.lightBlueAccent,
        ),
        title: Text(
          'Our Services',
          style: TextStyle(color: Colors.indigo, fontFamily: 'Montserrat'),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            children: [
              Container(
                // image below the top bar
                child: SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Image.asset(
                    'assets/images/index2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                heightFactor: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 150),
                  width: screenSize.width / 1.2,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: InkWell(
                              onHover: (value) {
                                setState(() {
                                  _isHovering[0] = value;
                                });
                              },
                              child: Text(
                                menus[0].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat-light',
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                _isHovering[1] = value;
                              });
                            },
                            onTap: () {
                              Navigator.pushNamed(context, '/services');
                            },
                            child: Text(
                              menus[1].title,
                              style: TextStyle(
                                  color: Colors.blue[200],
                                  fontFamily: 'Montserrat-light',
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                _isHovering[2] = value;
                              });
                            },
                            child: Text(
                              menus[2].title,
                              style: TextStyle(
                                  color: Colors.blue[200],
                                  fontFamily: 'Montserrat-light',
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                _isHovering[3] = value;
                              });
                            },
                            child: Text(
                              menus[3].title,
                              style: TextStyle(
                                  color: Colors.blue[200],
                                  fontFamily: 'Montserrat-light',
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                                    onPressed: (){},

                              icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                          IconButton(
                                    onPressed: (){},

                              icon: Icon(
                            Icons.shopping_basket_outlined,
                            color: Colors.white,
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
               Positioned(
                top: 350,
                left: screenSize.width / 10,
                child: Text(
                  "we help",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 40,
                      color: Colors.blue),
                ),
              ),
              Positioned(
                top: 390,
                left: screenSize.width / 10,
                child: Text(
                  "growing buisness",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: screenSize.width/15,
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: 520,
                left: screenSize.width / 10,
                child: Text(
                  "We help you managing asset, provide financial advise. Leave money\nissue with us and focus on your core business.",
                  style: TextStyle(
                      fontFamily: 'Montserrat-light',
                      fontSize: 22,
                      color: Colors.white,
                      height: 2),
                ),
              ),
              Positioned(
                top: 700,
                left: screenSize.width / 10,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.white)),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Contact Us'),
                  ),
                ),
              ),
             
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/home-icon-1.png'),
                          Text(
                            'On Time Service.',
                            style:
                                TextStyle(color: Colors.indigo, fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                          'Transforming distribution and \nmarketing with key capabilities in \ncustomer insight and analytics.'),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/home-icon-2.png'),
                          Text(
                            'A Team Of\nProfessionals.',
                            style:
                                TextStyle(color: Colors.indigo, fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                          'Transforming distribution and \nmarketing with key capabilities in \ncustomer insight and analytics.'),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/home-icon-3.png'),
                          Text(
                            'Analyze Your\nBusiness.',
                            style:
                                TextStyle(color: Colors.indigo, fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                          'Transforming distribution and \nmarketing with key capabilities in \ncustomer insight and analytics.'),
                    ],
                  )
                ]),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'SERVICES',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: screenSize.width / 7,
                    color: Colors.black.withOpacity(.05),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Services We Provide',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Montserrat',
                      fontSize: 40),
                ),
              ),
              Align(
                heightFactor: 4,
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Covered in these areas',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Montserrat-light',
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
         
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'E-mail Us',
        child: Icon(Icons.mail),
      ),
    );
  }
}
