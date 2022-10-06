import 'package:deriv_api/deriv_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/cubit/price_bloc.dart';
import 'package:price_tracker/cubit/price_event.dart';
import 'package:price_tracker/widget.dart/drop_down_widget.dart';

class PriceTrackerPage extends StatefulWidget {
  const PriceTrackerPage({Key? key}) : super(key: key);

  @override
  State<PriceTrackerPage> createState() => _PriceTrackerPageState();
}

class _PriceTrackerPageState extends State<PriceTrackerPage> {
  List<String> symbolList = [];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Price tracker')),
      body: BlocConsumer<PriceCubit, PriceState>(
        listener: (context, state) {},
        buildWhen: (prev, curr) => curr.fetchType.isMarketFetch,
        builder: (context, state) {
          switch (state.priceStatus) {
            // case PriceStatus.initial:
            case PriceStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PriceStatus.success:
            default:
              final markets =
                  state.markets.map((e) => e.market).toSet().toList();
              final marketList = ['Select a Market', ...markets];

              // final marketList = state.markets.map((e) => e.market).toList();

              // final symbolList = state.markets.map((e) => e.symbol).toList();
              // final symbolList = state.markets.where((element) => element.symbol == ,)

              // symbolList =
              //     getSymbols(state.markets, state.markets.first.displayName);
              return Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 48.0,
                  ),
                  DropDownWidget(
                      onValueChanged: (value) async {
                        /// Here is a hech to overcome crash for duplicate values in DropDownWidget
                        /// I rebuild the second dropdown with fresh data based on first
                        /// dropdown selected item
                        setState(() {
                          symbolList = [];
                        });
                        await Future.delayed(const Duration(milliseconds: 10));
                        setState(() {
                          symbolList = getSymbols(state.markets,
                              value ?? state.markets.first.market);
                        });
                      },
                      title: 'Select a Market',
                      items: marketList),
                  const SizedBox(
                    height: 12.0,
                  ),
                  symbolList.isNotEmpty
                      ? DropDownWidget(
                          onValueChanged: (value) {
                            setState(() {});
                            if (symbolList.first == value) return;
                            context
                                .read<PriceCubit>()
                                .add(PriceFetched(value!));
                          },
                          title: 'Select an Asset',
                          items: symbolList,
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 32.0,
                  ),
                  BlocBuilder<PriceCubit, PriceState>(
                    builder: (context, state) {
                      return state.fetchType.isMarketFetch
                          ? const SizedBox.shrink()
                          : state.priceStatus.isSuccess
                              ? Text(
                                  'Price ${state.price?.quote}',
                                  style: theme.textTheme.headline6
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                )
                              : const CircularProgressIndicator();
                    },
                  ),
                ],
              );
          }
        },
      ),
    );
  }

  List<String> getSymbols(List<Market> markets, String disPlayName) {
    return [
      'Select an Asset',
      ...markets
          .where((element) => element.market == disPlayName)
          .toList()
          .map<String>((e) => e.symbol)
          .toList()
    ];
  }
}
