import 'package:flutter/material.dart';
import 'package:songgpt/core/utils/info.dart';
import 'package:songgpt/features/home/widgets/logout_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.white : Colors.black,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.black : Colors.white, // Back icon color
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40).copyWith(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                  ),
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black, // Container color based on theme
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.sstatic.net/l60Hf.png',
                      ),
                      radius: 80,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: isDarkMode ? Colors.black : Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                isDarkMode ? Colors.black : Colors.white,
                            side: BorderSide(
                              color: isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                          child: const Text('Edit Profile'),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                isDarkMode ? Colors.black : Colors.white,
                            side: BorderSide(
                              color: isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                          child: const Text('Change Password'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'Created Songs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: createdSongs.length,
              itemBuilder: (context, index) {
                final song = createdSongs[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(song['name'].toString()),
                      leading: Text(
                        '${index + 1}. ',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        song['genre'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 0.1,
                    ),
                  ],
                );
              },
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: LogoutButton(),
            ),
          )
        ],
      ),
    );
  }
}
