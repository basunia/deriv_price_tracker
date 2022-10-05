import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/cubit/price_bloc.dart';
import 'package:price_tracker/widget.dart/drop_down_widget.dart';

class PriceTrackerPage extends StatelessWidget {
  const PriceTrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Price tracker')),
      body: BlocConsumer<PriceCubit, PriceState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.priceStatus) {
            case PriceStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PriceStatus.success:
            default:
              final marketList =
                  state.markets.map((e) => e.displayName).toList();
              final symbolList = state.markets.map((e) => e.symbol).toList();

              return Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 48.0,
                  ),
                  DropDownWidget(
                      title: 'Select a Market', items: marketList, key: key),
                  const SizedBox(
                    height: 20.0,
                  ),
                  DropDownWidget(
                      title: 'Select an Asset', items: symbolList, key: key)
                ],
              );
          }
        },
      ),
    );
  }
}
