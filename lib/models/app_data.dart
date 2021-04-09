import 'dart:convert';

class NazarData {
  final List data;
  final int total;
  final bool has_next;
  final int next_page;

  NazarData({
    this.data,
    this.total = 0,
    this.has_next = false,
    this.next_page = 1,
  });

  factory NazarData.fromJson(Map<String, dynamic> json) => NazarData(
      data: json['data'],
      total: json['total'],
      has_next: json['has_next'],
      next_page: json['next_page'],
  );
}
