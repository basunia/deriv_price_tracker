import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:deriv_api/deriv_api.dart';
import 'package:deriv_repository/deriv_repository.dart';

part 'price_state.dart';

class PriceCubit extends Cubit<PriceState> {
  PriceCubit({required PriceTrackerRepostory repostory})
      : _repository = repostory,
        super(const PriceState());

  final PriceTrackerRepostory _repository;

  void getMarketSymbol() {
    try {
      _repository.getMarketSymbol();
    } catch (e) {}
  }

  void subscribToPrice(String marketSymbol) {
    try {
      _repository.getPrice(marketSymbol: marketSymbol);
    } catch (e) {}
  }
}
