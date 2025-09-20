import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../models/profile_info.dart';
import 'profile_screen.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Category')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: profileData.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final ProfileInfo info = profileData[index];
          return Card(
            elevation: 1,
            child: ListTile(
              leading: const Icon(Icons.category_outlined),
              title: Text(info.infoDescription,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text('${info.infoItems.length} items'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(info: info),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
