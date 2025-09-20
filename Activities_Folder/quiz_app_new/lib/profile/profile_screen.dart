import 'package:flutter/material.dart';
import '../models/profile_info.dart';


class ProfileScreen extends StatefulWidget {
  final ProfileInfo info;
  const ProfileScreen({super.key, required this.info});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<String> _items;

  @override
  void initState() {
    super.initState();
    _items = List.of(widget.info.infoItems);
  }

  void _shuffle() {
    setState(() => _items = widget.info.getShuffledList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.info.infoDescription),
        actions: [
          IconButton(
            tooltip: 'Shuffle',
            onPressed: _shuffle,
            icon: const Icon(Icons.shuffle_rounded),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final text = _items[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.indigo.shade100),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${index + 1}. ',
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                Expanded(child: Text(text)),
              ],
            ),
          );
        },
      ),
    );
  }
}
