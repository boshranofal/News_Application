class EverythingBody {
  final String q;
  final String? searchIn;
  final int pageSize;
  final int page;

  EverythingBody({
    required this.q,
    this.searchIn,
    this.pageSize = 7,
    this.page = 1,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'q': q});
    if (searchIn != null) {
      result.addAll({'searchIn': searchIn});
    }
    result.addAll({'pageSize': pageSize});
    result.addAll({'page': page});

    return result;
  }

  factory EverythingBody.fromMap(Map<String, dynamic> map) {
    return EverythingBody(
      q: map['q'],
      searchIn: map['searchIn'],
      pageSize: map['pageSize'],
      page: map['page'],
    );
  }
}
