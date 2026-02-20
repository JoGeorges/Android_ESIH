import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationDemo(),
    );
  }
}

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({super.key});

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  final notifications = FlutterLocalNotificationsPlugin();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() => timer?.cancel();

  Future<void> _init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(requestAlertPermission: true);
    await notifications.initialize(const InitializationSettings(android: android, iOS: ios));
    await notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel('channel', 'Notifications', importance: Importance.max));
  }

  Future<void> _show(int id, String title, String body) async {
    await notifications.show(id, title, body, const NotificationDetails(
      android: AndroidNotificationDetails('channel', 'Notifications', importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(),
    ));
  }

  Future<void> _immediate() => _show(1, 'Imedyat', 'Parèt touswit!');

  Future<void> _scheduled() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pral parèt nan 1 minit')));
    await Future.delayed(const Duration(minutes: 1));
    await _show(2, 'Pwograme', '1 minit apre!');
  }

  Future<void> _repeating() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Premye nan 2 minit')));
    await Future.delayed(const Duration(minutes: 2));
    await _show(3, 'Repete #1', 'Apre 2 minit');
    timer = Timer.periodic(const Duration(minutes: 2), (t) => _show(3, 'Repete #${t.tick + 1}', 'Chak 2 minit'));
  }

  Future<void> _longText() => _show(4, 'Tèks Long', 'Notifikasyon ak anpil tèks. Ou ka mete yon mesaj trè long. Sa bon pou bay anpil enfòmasyon.');

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Notifikasyon', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      centerTitle: true,
    ),
    body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _btn('Imedyat', _immediate),
            const SizedBox(height: 20),
            _btn('Pwograme', _scheduled),
            const SizedBox(height: 20),
            _btn('Repete', _repeating),
            const SizedBox(height: 20),
            _btn('Tèks Long', _longText),
          ],
        ),
      ),
    ),
  );

  Widget _btn(String txt, VoidCallback onPressed) => SizedBox(
    width: 220,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.black, width: 1.5),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(txt, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  );
}
