class MainModel {
  final TimeApi time;
  final BpiApi bpi;
  MainModel({
    required this.time,
    required this.bpi,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      time: TimeApi.fromJson(json["time"]),
      bpi: BpiApi.fromJson(
        json["bpi"],
      ),
    );
  }
}

class TimeApi {
  final String updated;

  TimeApi({
    required this.updated,
  });

  factory TimeApi.fromJson(Map<String, dynamic> json) {
    return TimeApi(
      updated: json["updated"],
    );
  }
}

class UsdApi {
  final String code;
  final String rate;
  final String description;
  final double rateFloat;

  UsdApi({
    required this.code,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory UsdApi.fromJson(Map<String, dynamic> json) {
    return UsdApi(
      code: json["code"],
      rate: json["rate"],
      description: json["description"],
      rateFloat: json["rate_float"],
    );
  }
}

class GbpApi {
  final String code;
  final String rate;
  final String description;
  final double rateFloat;

  GbpApi({
    required this.code,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory GbpApi.fromJson(Map<String, dynamic> json) {
    return GbpApi(
      code: json["code"],
      rate: json["rate"],
      description: json["description"],
      rateFloat: json["rate_float"],
    );
  }
}

class EurApi {
  final String code;
  final String rate;
  final String description;
  final double rateFloat;

  EurApi({
    required this.code,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory EurApi.fromJson(Map<String, dynamic> json) {
    return EurApi(
      code: json["code"],
      rate: json["rate"],
      description: json["description"],
      rateFloat: json["rate_float"],
    );
  }
}

class BpiApi {
  final UsdApi usd;
  final GbpApi gbp;
  final EurApi eur;

  BpiApi({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory BpiApi.fromJson(Map<String, dynamic> json) {
    return BpiApi(
      usd: UsdApi.fromJson(
        json["USD"],
      ),
      gbp: GbpApi.fromJson(
        json["GBP"],
      ),
      eur: EurApi.fromJson(
        json["EUR"],
      ),
    );
  }
}
