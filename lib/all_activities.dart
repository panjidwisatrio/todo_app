import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/activity.dart';

class AllActivities extends StatefulWidget {
  const AllActivities({super.key});

  @override
  State<AllActivities> createState() => _AllActivitiesState();
}

class _AllActivitiesState extends State<AllActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('All Activities', style: TextStyle(color: Colors.black)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: activityList.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 200.0, bottom: 200.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.sentiment_dissatisfied,
                          size: 100.0,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.0),
                        Center(
                          child: Text(
                            'No Activity',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final Activity activity = activityList[index];
                      var date = DateFormat.EEEE().format(activity.date);
                      var timeHour = activity.time.hour;
                      var timeMinute = activity.time.minute.runtimeType == int
                          ? activity.time.minute
                          : '0${activity.time.minute}';
                      var time = '$timeHour:$timeMinute';

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color:
                                            Color.fromARGB(255, 38, 110, 241),
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
                    itemCount: activityList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
          ),
        ),
      ),
    );
  }
}
