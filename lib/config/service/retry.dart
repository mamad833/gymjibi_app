import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helper/custom_button.dart';
import 'global.dart';

class RetryPage extends StatefulWidget {
  final bool backAccess;
  final String? message;

  const RetryPage({Key? key, required this.backAccess, this.message})
      : super(key: key);

  @override
  State<RetryPage> createState() => _RetryPageState();
}

class _RetryPageState extends State<RetryPage> {
  bool _connection = true;

  ConnectivityResult? _connectionStatus;
  final Connectivity _connectivity = Connectivity();

  StreamSubscription<ConnectivityResult>? _connectionSubscription;

  @override
  void initState() {
    _initConnectivity();

    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          setState(() {
            _connectionStatus = result;
          });
        });
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return widget.backAccess;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Size get _size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.red,
          body: SizedBox(
            width: _size.width,
            child: Column(
              /// from
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 50),
                        // Center(
                        //   child: Image.asset(
                        //     ImagesApp.logoApp,
                        //     width: 200.w,
                        //     height: 200.h,
                        //   ),
                        // ),
                        const SizedBox(height: 25),
                        Text(
                          widget.message ?? "An error occurred in establishing the connection",
                          textAlign: TextAlign.center,
                          style: TextStyle().copyWith(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37),
                  child: Column(
                    children: [
                      MyCustomButton(
                        title: "Try again",
                        loading: false,
                        onTap: () {
                          _initConnectivity();
                          if (_connection) {
                            for (var element in GEasyHelper.retries) {
                              element();
                            }
                            GEasyHelper.retries = [];
                            Navigator.pop(context);
                          }
                        },
                      ),
                      // CustomButton(
                      //   title: "RÉESSAYER",
                      //   context: context,
                      //   loading: false,
                      //   onTap: () {
                      //     _initConnectivity();
                      //     if (_connection) {
                      //       for (var element in GEasyHelper.retries) {
                      //         element();
                      //       }
                      //       GEasyHelper.retries = [];
                      //       Navigator.pop(context);
                      //     }
                      //   },
                      // ),
                      SizedBox(height: 16),
                      // CustomButton(
                      //   title: "Back",
                      //   context: context,
                      //   loading: false,
                      //   onTap: () => Navigator.pop(context),
                      //   // onTap: () => OpenSettings.openWIFISetting(),
                      // ),
                      SizedBox(height: 34),
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

  Future _initConnectivity() async {
    // ConnectivityResult? connectionStatus;

    try {
      // connectionStatus = await _connectivity.checkConnectivity();
    } catch (e) {
      setState(() {
        _connection = false;
      });
    }

    if (!mounted) {
      return;
    }

    // setState(() {
    //   _connectionStatus = connectionStatus;
    // });
    // if (_connectionStatus == ConnectivityResult.mobile ||
    //     _connectionStatus == ConnectivityResult.wifi) {
    //   try {
    //     final result = await InternetAddress.lookup('1.1.1.1')
    //         .timeout(const Duration(seconds: 2));
    //     if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
    //       _connection = true;
    //     } else {
    //       setState(() {
    //         _connection = false;
    //       });
    //     }
    //   } on SocketException catch (_) {
    //     setState(() {
    //       _connection = false;
    //     });
    //   }
    // } else {
    //   setState(() {
    //     _connection = false;
    //   });
    // }
  }

  @override
  void dispose() {
    // _connectionSubscription!.cancel();
    super.dispose();
  }
}
