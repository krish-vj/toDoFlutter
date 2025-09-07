import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Developer Info"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Krish Joshi",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Developed and Maintained this app.\n This is my first Flutter app.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Divider(color: Theme.of(context).dividerColor),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () => _launchURL("https://github.com/krish-vj"),
                            icon: Image.asset('assets/github.png', width: 40, height: 40),
                            tooltip: 'GitHub',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: IconButton(
                            onPressed: () => _launchURL("https://www.linkedin.com/in/krish-vj/"),
                            icon: Image.asset('assets/link.png', width: 40, height: 40),
                            tooltip: 'LinkedIn',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: IconButton(
                            onPressed: () => _launchURL("mailto:joshikrish533@example.com"),
                            icon: Image.asset('assets/gmail1.png', width: 40, height: 40),
                            tooltip: 'Email',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}