import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/repository/authentication_repo.dart';
import 'package:meworld/core/services/service_locator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const _ProfileDetails(),
        const Divider(),
        ListTile(
            onTap: () {
              GoRouter.of(context).push('/Settings');
            },
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined)),
        ListTile(
            onTap: () {
              GoRouter.of(context).push('/AccountInfo');
            },
            leading: const Icon(Icons.money),
            title: const Text("Account Info"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined)),
        const Divider(),
        ElevatedButton(
            onPressed: () async {
              // await FirebaseAuth.instance.signOut();
              await sl<AuthenticationRepo>().signOut();
            },
            child: const Text("Logout")),
        ElevatedButton(
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 300,
                        child: Column(children: [
                          const Text(
                              'A reset email would be sent to ******@gmail.com. Continue ?'),
                          const Divider(),
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: ListTile(
                                      leading: Icon(Icons.info),
                                      title: Text(
                                          "A reset email has been sent to stuff, do stuff with it"),
                                    )));
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Continue"))
                            ],
                          )
                        ]),
                      ),
                    );
                  });
            },
            child: const Text("Reset Password"))
      ]),
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: FlutterLogo(),
      title: Text("First Name, Last Name"),
      subtitle: Text("something else"),
    );
  }
}
