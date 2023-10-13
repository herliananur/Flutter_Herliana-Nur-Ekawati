import 'package:flutter/material.dart';
import 'package:project/widget/drawer_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    DrawerWidget drawerWidget = buildDrawer(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Alterra Academy Programs',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return const AboutProgramCard();
                },
              ),
            ),
          ],
        ),
      ),
      endDrawer: drawerWidget,
    );
  }

  DrawerWidget buildDrawer(BuildContext context) {
    return const DrawerWidget();
  }
}

class AboutProgramCard extends StatelessWidget {
  const AboutProgramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/images/dashboard.png'),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Immersive Program',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Program pelatihan coding bootcamp intensif bagi kamu yang pemula, baik dengan latar belakang IT maupun Non-IT, untuk menjadi seorang Software Engineer profesional dalam waktu 9 Minggu.',
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
