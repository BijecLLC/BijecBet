import 'package:decimal/decimal.dart';

class ArbOutcome {
  const ArbOutcome({
    required this.name,
    required this.price,
    required this.bookmakerKey,
    required this.bookmakerTitle,
  });

  final String name;
  final Decimal price;
  final String bookmakerKey;
  final String bookmakerTitle;
}

//Class to represent one Arb opporunity
class ArbOpportunity {
  const ArbOpportunity({
    required this.eventId,
    required this.sportKey,
    required this.eventName,
    required this.marketLabel,
    required this.outcomes,
    required this.arbitrageSum,
    required this.profitMarginPercent,
    required this.commenceTime,
    required this.lastUpdatedAt,
  });

  final String eventId;
  final String sportKey;
  final String eventName;
  final String marketLabel;
  final List<ArbOutcome> outcomes;
  final Decimal arbitrageSum;
  final Decimal profitMarginPercent;
  final DateTime commenceTime;
  final DateTime lastUpdatedAt;

  String get favoriteId {
    final outcomeBookmakers = outcomes.map((o) => o.bookmakerKey).toList()..sort();
    return '$eventId|$marketLabel|${outcomeBookmakers.join("|")}';
  }
}
