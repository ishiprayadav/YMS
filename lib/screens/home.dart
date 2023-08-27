import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

import 'package:yms/screens/incomingRegistration.dart';
import 'package:yms/screens/parkingScreen.dart';
import 'package:yms/screens/phone.dart';
import 'package:yms/screens/qr_scan.dart';
import 'package:yms/screens/yardScreen.dart';
import 'package:yms/widgets/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YardMaster"),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      endDrawer: const SafeArea(child: SideBarWidget()),
      body: TabBarView(
        controller: _motionTabBarController,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              height: MediaQuery.of(context).size.height * 0.76,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('here');
                      Navigator.of(context)
                          .pushNamed(IncomingRegistration.routeName);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      elevation: 5,
                      child: SizedBox(
                        height: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/incoming.gif'),
                            const Text(
                              'Incoming',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(QRViewExample.routeName);
                      // Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const OutgoingRegistration(
                      //       vRegNo: "47465090-3ce2-11ee-bd4b-81b16a178a14"),
                      // ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      elevation: 5,
                      child: SizedBox(
                        height: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/outgoing.gif'),
                            const Text(
                              'Outgoing',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(MyPhone.routeName);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      elevation: 5,
                      child: SizedBox(
                        height: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/outgoing.gif'),
                            const Text(
                              'Records',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const YardScreen(),
          const ParkingScreen(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        tabBarColor: Colors.blueAccent,
        controller: _motionTabBarController,
        labels: const [
          "Home",
          "Records",
          "Dashboard",
        ],
        initialSelectedTab: "Home",
        tabIconColor: Colors.white,
        tabSelectedColor: Colors.amber,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController?.index = value;
          });
        },
        icons: const [
          Icons.home,
          Icons.receipt,
          Icons.person,
        ],
        textStyle:
            const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
      ),
    );
  }
}
