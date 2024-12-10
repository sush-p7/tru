import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 100,
            child: DrawerHeader(
              // margin:
              //     EdgeInsets.zero, // Removes default padding of DrawerHeader
              // padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.primaryText,
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //   image: AssetImage('assets/images/cover.jpg'),
                // ),
              ),
              child: UserIDWidget(),
            ),
          ),
          ListTile(
            leading: const Icon(Ionicons.settings),
            title: const Text('Settings'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Ionicons.log_out),
            title: const Text('logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Settings'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.border_color),
          //   title: const Text('Feedback'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.exit_to_app),
          //   title: const Text('Logout'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}

class UserIDWidget extends StatelessWidget {
  const UserIDWidget({super.key});

  Future<String> getUserID() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final storedToken = await storage.read(key: 'USER');
    print(storedToken);
    return storedToken ?? 'No UserID Found';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getUserID(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
              backgroundColor: Colors.transparent);
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                backgroundColor: Colors.transparent),
          );
        } else {
          return Text(
            snapshot.data ?? 'No UserID Found',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                backgroundColor: Colors.transparent),
          );
        }
      },
    );
  }
}
