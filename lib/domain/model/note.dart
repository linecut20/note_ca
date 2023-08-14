class Note {
  int? _id;
  String _title;
  String _content;
  DateTime _regdate;
  int _colorCode;

  Note(
      {int? id,
      required String title,
      required String content,
      required DateTime regdate,
      required int colorCode})
      : _id = id,
        _title = title,
        _content = content,
        _regdate = regdate,
        _colorCode = colorCode;

  int? get id => _id;
  String get title => _title;
  String get content => _content;
  DateTime get regdate => _regdate;
  int get colorCode => _colorCode;

  set id(int? id) {
    _id = id;
  }

  set title(String title) {
    _title = title;
  }

  set content(String content) {
    _content = content;
  }

  set regdate(DateTime regdate) {
    _regdate = regdate;
  }

  set colorCode(int colorCode) {
    _colorCode = colorCode;
  }

  Map<String, dynamic> toJson() {
    var json = {
      'title': _title,
      'content': _content,
      'regdate': _regdate.millisecondsSinceEpoch,
      'color_code': _colorCode
    };

    if (_id != null) {
      json['id'] = _id!;
    }

    return json;
  }

  static Note fromJson(Map<String, dynamic> json) => Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      regdate: DateTime.fromMillisecondsSinceEpoch(json['regdate']),
      colorCode: json['color_code']);
}
