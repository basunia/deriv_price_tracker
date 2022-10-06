import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:price_tracker/app.dart';
import 'package:price_tracker/service_locator.dart';

import 'bloc_observer.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final service = ServiceLocator();
  Bloc.observer = PriceBlocObserver();
  runApp(PriceTrackerApp(
    repostory: service.repository,
  ));
}
