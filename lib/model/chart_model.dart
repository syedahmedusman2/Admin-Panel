// To parse this JSON data, do
//
//     final chartModel = chartModelFromJson(jsonString);

import 'dart:convert';

ChartModel chartModelFromJson(String str) =>
    ChartModel.fromJson(json.decode(str));

String chartModelToJson(ChartModel data) => json.encode(data.toJson());

class ChartModel {
  ChartModel({
    this.domain,
    this.measure,
  });

  String? domain;
  int? measure;

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        domain: json["domain"],
        measure: json["measure"],
      );

  Map<String, dynamic> toJson() => {
        "domain": domain,
        "measure": measure,
      };
}
