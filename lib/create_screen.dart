import 'package:exploration_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'model/activity.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  _CreateActivityState createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> with RestorationMixin {
  String? activityName;
  String? activityDescription;
  Category? activityCategory;
  String? _hintTextTime = 'Enter Activity Time';
  TimeOfDay? _time;

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2023, 4, 20));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2023),
          lastDate: DateTime(2024),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  void _setHintTextTime(String hintText) {
    _time = TimeOfDay(
        hour: int.parse(hintText.split(":")[0]),
        minute: int.parse(hintText.split(":")[1]));

    setState(() {
      _hintTextTime = hintText.toString();
    });
  }

  void _createActivity(
    String name,
    String description,
    Category category,
    DateTime date,
    TimeOfDay time,
  ) {
    var idActivity = activityList.length + 1;
    Activity newActivity = Activity(
      idActivity: idActivity,
      name: name,
      description: description,
      category: category,
      date: date,
      time: time,
    );
    activityList.add(newActivity);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Activity',
            style: TextStyle(color: Colors.black)),
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Activity Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Activity Name',
                        ),
                        onChanged: (value) => activityName = value,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Activity Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        minLines: 1,
                        maxLines: 5,
                        maxLength: 100,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Activity Description',
                        ),
                        onChanged: (value) => activityDescription = value,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Activity Category',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        hint: const Text('Select Category'),
                        isExpanded: true,
                        menuMaxHeight: 200,
                        items: List.from(
                            categoriesList.map((e) => DropdownMenuItem(
                                  value: e.name,
                                  child: Text(e.name),
                                ))),
                        onChanged: (value) {
                          setState(() {
                            activityCategory = categoriesList
                                .firstWhere((element) => element.name == value);
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Activity Date',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        readOnly: true,
                        showCursor: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:
                              '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
                        ),
                        onTap: () {
                          _restorableDatePickerRouteFuture.present();
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Activity Time',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        readOnly: true,
                        showCursor: false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: _hintTextTime,
                        ),
                        onTap: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            _setHintTextTime('${date.hour}:${date.minute}');
                          }, onConfirm: (date) {
                            _setHintTextTime('${date.hour}:${date.minute}');
                          }, currentTime: DateTime.now());
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          _createActivity(
                            activityName!,
                            activityDescription!,
                            activityCategory!,
                            _selectedDate.value,
                            _time!,
                          );
                        },
                        child: const Text('Create'),
                      ),
                    ],
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
