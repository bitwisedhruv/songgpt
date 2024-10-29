import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/core/theme/theme_provider.dart';
import 'package:songgpt/features/home/widgets/new_chat_list.dart';
import 'package:songgpt/features/home/screens/profile_screen.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0).copyWith(left: 0, right: 0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                title: const Text('Name'),
                leading: const CircleAvatar(
                  radius: 30,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.forward,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 0.3,
            ),
            const ListTile(
              title: Text('Explore'),
              leading: Icon(Icons.search),
            ),
            const ListTile(
              title: Text('About'),
              leading: Icon(Icons.info_outline),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: ref.watch(themeProvider),
                onChanged: (val) =>
                    ref.read(themeProvider.notifier).toggleTheme(),
              ),
            ),
            const Divider(
              thickness: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: OutlinedButton.icon(
                onPressed: () {},
                label: const Text(
                  'Add new chat',
                ),
                icon: const Icon(
                  Icons.add,
                ),
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(
                    237,
                    33,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: ChatList(),
            )
          ],
        ),
      ),
    );
  }
}
