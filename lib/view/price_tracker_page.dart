import 'package:deriv_api/deriv_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/bloc/price_bloc.dart';
import 'package:price_tracker/bloc/price_event.dart';
import 'package:price_tracker/widget.dart/custom_error_widget.dart';
import 'package:price_tracker/widget.dart/drop_down_widget.dart';

class PriceTrackerPage extends StatefulWidget {
  const PriceTrackerPage({Key? key}) : super(key: key);

  @override
  State<PriceTrackerPage> createState() => _PriceTrackerPageState();
}

class _PriceTrackerPageState extends State<PriceTrackerPage> {
  List<String> symbolList = [];

  void _fetchMarket() {
    context.read<PriceBloc>().add(MarketFetched());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Price tracker')),
      body: BlocConsumer<PriceBloc, PriceState>(
        listener: (context, state) {},
        buildWhen: (prev, curr) => curr.fetchType.isMarketFetch,
        builder: (context, state) {
          switch (state.priceStatus) {
            case PriceStatus.noConnection:
              return CustomErrorWidget(
                  onRefresh: _fetchMarket,
                  title: 'No connection',
                  subTitle: 'Please check your network connection.',
                  actionText: 'Retry');
            case PriceStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PriceStatus.success:
            default:
              final markets =
                  state.markets.map((e) => e.market).toSet().toList();
              final marketList = ['Select a Market', ...markets];

              return Column(
                children: [
                  const SizedBox(
                    height: 48.0,
                  ),
                  DropDownWidget(
                      onValueChanged: (value) async {
                        /// Here is a workaround to overcome crash for duplicate values in DropDownWidget
                        /// It rebuilds the second dropdown with fresh data based on first
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
                    height: 22.0,
                  ),
                  symbolList.isNotEmpty
                      ? DropDownWidget(
                          onValueChanged: (value) {
                            setState(() {});
                            if (symbolList.first == value) return;
                            context.read<PriceBloc>().add(PriceFetched(value!));
                          },
                          title: 'Select an Asset',
                          items: symbolList,
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 58.0,
                  ),
                  BlocBuilder<PriceBloc, PriceState>(
                    builder: (context, state) {
                      final price = state.price;
                      return state.fetchType.isMarketFetch
                          ? const SizedBox.shrink()
                          : state.priceStatus.isSuccess
                              ? Text(
                                  'Price ${state.price?.quote}',
                                  style: theme.textTheme.headline6
                                      ?.copyWith(fontWeight: FontWeight.w400)
                                      .copyWith(
                                          color: price!.bid > price.quote
                                              ? Colors.red
                                              : price.bid == price.quote
                                                  ? Colors.grey
                                                  : Colors.green),
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
          .map<String>((e) => e.symbol)
          .toList()
    ];
  }
}
