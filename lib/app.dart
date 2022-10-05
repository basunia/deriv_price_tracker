import 'package:deriv_repository/deriv_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/cubit/price_bloc.dart';
import 'package:price_tracker/cubit/price_event.dart';
import 'package:price_tracker/view/price_tracker_page.dart';

class PriceTrackerApp extends StatelessWidget {
  const PriceTrackerApp({Key? key, required PriceTrackerRepostory repostory})
      : _repostory = repostory,
        super(key: key);

  final PriceTrackerRepostory _repostory;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repostory,
      child: BlocProvider(
        create: (context) =>
            PriceCubit(repostory: context.read<PriceTrackerRepostory>())
              ..add(MarketFetched()),
        child: const PriceTrackerAppView(),
      ),
    );
  }
}

class PriceTrackerAppView extends StatelessWidget {
  const PriceTrackerAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Price tracker';
    return const MaterialApp(
      title: title,
      home: MaterialApp(
        title: title,
        home: PriceTrackerPage(),
      ),
    );
  }
}
