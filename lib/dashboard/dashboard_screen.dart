import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_app/dashboard/dashboard_screen_provider.dart';
import 'package:step_app/routes/route_name.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  // late Stream<StepCount> _stepCountStream;
  // late Stream<PedestrianStatus> _pedestrianStatusStream;
  // String _status = '?', _steps = '?';
  //
  // bool isGetInitialValue = false;
  // int pedometerInitialValue = 0;
  //
  // ////////
  //
  // Timer? apiTimer;
  //
  // bool shouldCallApiFunction = true;

//  HomeScreenProvider homeProvider = HomeScreenProvider();
  // HomeScreenProvider provider = Provider.of(context,listen: false);

  @override
  void initState() {
    super.initState();

    // var homeProvider =  Provider.of(context,listen: false);
    //  homeProvider = Provider.of<HomeScreenProvider>(context, listen: false);

    context.read<DashBoardScreenProvider>().getV();

    //  homeProvider.checkPermission();
  }

  // addTimerForApiCall() {
  //   apiTimer = Timer.periodic(Duration(seconds: 5), (timer) {
  //     // Call your function here
  //     print('Function called at ${DateTime.now()}');
  //     CommonMethod.showSuccessToast(msg: "Api Called", context: context);
  //   });
  // }
  //
  // void onStepCount(StepCount event) {
  //   print(event);
  //   setState(() {
  //     if (isGetInitialValue == false) {
  //       pedometerInitialValue = event.steps;
  //       isGetInitialValue = true;
  //     }
  //     //   _steps = event.steps.toString();
  //
  //     var calculatedStep = event.steps - pedometerInitialValue;
  //     _steps = calculatedStep.toString();
  //   });
  // }
  //
  // void onPedestrianStatusChanged(PedestrianStatus event) {
  //   print(event);
  //   setState(() {
  //     _status = event.status;
  //   });
  // }
  //
  // void onPedestrianStatusError(error) {
  //   print('onPedestrianStatusError: $error');
  //   setState(() {
  //     _status = 'Pedestrian Status not available';
  //   });
  //   print(_status);
  // }
  //
  // void onStepCountError(error) {
  //   print('onStepCountError: $error');
  //   setState(() {
  //     _steps = 'Step Count not available';
  //   });
  // }
  //
  // Future<void> checkPermission() async {
  //   // PermissionStatus status = await Permission.activityRecognition.status;
  //   PermissionStatus status = await Permission.activityRecognition.request();
  //
  //   if (status.isGranted) {
  //     // Permission is already granted, proceed with using the pedometer
  //
  //     initPlatformState();
  //   } else {
  //     // Permission is not granted, request it
  //   }
  // }
  //
  // void initPlatformState() {
  //   _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
  //   _pedestrianStatusStream
  //       .listen(onPedestrianStatusChanged)
  //       .onError(onPedestrianStatusError);
  //
  //   _stepCountStream = Pedometer.stepCountStream;
  //   _stepCountStream.listen(onStepCount).onError(onStepCountError);
  //
  //   if (!mounted) return;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<DashBoardScreenProvider>(
          builder: (context, provider, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[



              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.settingScreen);
                },
                  child: Icon(Icons.settings,size: 32,)),

              SizedBox(
                height: 25,
              ),
              Text(
                'Steps Taken',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                provider.steps,
                style: TextStyle(fontSize: 60),
              ),
              Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                'Pedestrian Status',
                style: TextStyle(fontSize: 20),
              ),
              Icon(
                provider.status == 'walking'
                    ? Icons.directions_walk
                    : provider.status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 50,
              ),
              Center(
                child: Text(
                  provider.status,
                  style: provider.status == 'walking' ||
                          provider.status == 'stopped'
                      ? TextStyle(fontSize: 20)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
              Text(""),
              ElevatedButton(
                //     disabledColor: Colors.red,
                // disabledTextColor: Colors.black,

                onPressed: () {
                  setState(() {
                    provider.addTimerForApiCall();
                  });
                },
                child: const Text('Start Button'),
              ),
              ElevatedButton(
                //     disabledColor: Colors.red,
                // disabledTextColor: Colors.black,

                onPressed: () {
                  setState(() {
                    //  shouldCallApiFunction = false; // Set shouldCallFunction to false to stop function calls
                    provider.apiTimer
                        ?.cancel(); // Cancel the timer if it's running
                  });
                },
                child: const Text('Stop Button'),
              ),
              ElevatedButton(
                //     disabledColor: Colors.red,
                // disabledTextColor: Colors.black,

                onPressed: () {},
                child: const Text('Navigate'),
              ),
              ElevatedButton(
                //     disabledColor: Colors.red,
                // disabledTextColor: Colors.black,

                onPressed: () {
                  provider.updateV();
                },
                child: const Text('ChangeValue'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
