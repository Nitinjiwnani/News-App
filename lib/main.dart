import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/local/news.dart';
import 'package:flutter_news_app/firebase_options.dart';
import 'package:flutter_news_app/myapp.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await Hive.initFlutter();
  Hive.registerAdapter(NewsAdapter());
  await Hive.openBox('newsBox');
  runApp(const MyApp());
}