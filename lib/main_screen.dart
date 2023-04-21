// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exploration_app/model/activity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/user.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var day = DateTime.now().day;
  var month = DateFormat("MMM").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome Back,',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 179, 179, 179),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          args.nameUser as String,
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$day $month',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(Icons.calendar_month),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/background/bg_card.png'),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You have ${activityList.length} tasks today',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Don\'t forget to complete them or Create new one',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/CreateActivity');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          child: const Text(
                            'Create New Task',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 0, 20, 41),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Activity List',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/AllActivities');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 38, 110, 241),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    activityList.isEmpty
                        ? Padding(
                          padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                          child: Column(
                            children: const [
                              Icon(Icons.sentiment_dissatisfied, size: 100.0, color: Colors.grey,),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text('No Activity', style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              final Activity activity = activityList[index];
                              var date =
                                  DateFormat.EEEE().format(activity.date);
                              var timeHour = activity.time.hour;
                              var timeMinute =
                                  activity.time.minute.runtimeType == int
                                      ? activity.time.minute
                                      : '0${activity.time.minute}';
                              var time = '$timeHour:$timeMinute';

                              return Container(
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0.0, 0.0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            activity.name,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/DetailScreen',
                                                  arguments: activity);
                                            },
                                            child: const Text(
                                              'View All',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontFamily: 'Poppins',
                                                color: Color.fromARGB(
                                                    255, 38, 110, 241),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        activity.description,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.calendar_today,
                                                color: Colors.black,
                                                size: 12.0,
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                date,
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                                size: 12.0,
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                time,
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
