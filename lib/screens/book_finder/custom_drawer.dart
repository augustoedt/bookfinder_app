import 'package:book_finder/models/user.dart';
import 'package:book_finder/service/user_service.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: FutureBuilder<User>(
            future: UserService.loadLocalUser(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data;
                return ListView(
                  children: [
                    DrawerHeader(
                      duration: const Duration(milliseconds: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (user.userImage == "")
                            const CircleAvatar(
                              radius: 30,
                              foregroundColor: Colors.lightBlueAccent,
                              child: Icon(Icons.person),
                            )
                          else
                            const CircleAvatar(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(user.name),
                                IconButton(
                                  icon: const Icon(Icons.settings),
                                  onPressed: () {},
                                )
                              ])
                        ],
                      ),
                    ),
                    const ListTile(title: Text("Favorites"))
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Center(child: CircularProgressIndicator());
              }
              return const CircularProgressIndicator();
            }));
  }
}
