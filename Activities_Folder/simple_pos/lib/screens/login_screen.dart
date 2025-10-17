import 'package:flutter/material.dart';
import 'pos_main_screen.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const LoginScreen({super.key, required this.onToggleTheme});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _u = TextEditingController();
  final _p = TextEditingController();

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final ok = _u.text.trim() == 'Admin' && _p.text.trim() == 'admin1234';
    if (ok) {
      Navigator.pushReplacementNamed(context, POSMainScreen.route);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong credentials. Try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.of(context).size.width * 0.08;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            tooltip: 'Toggle Light/Dark',
            onPressed: widget.onToggleTheme,
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: EdgeInsets.all(pad),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _u,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _p,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(onPressed: _submit, child: const Text('Login')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
