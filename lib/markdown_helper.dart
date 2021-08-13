extension MarkDownHelper on String {
  String convertMarkDown() {
    var html = this;

    final stopwatch = Stopwatch()..start();

////////////  using _replace1 before _replace2 causes catastrophic backtracking
////////////  which leads to a longer execution time

    html = _replace1(html);
    html = _replace2(html);

    print('Executed in ${stopwatch.elapsed.inMilliseconds} Milliseconds');

    return html;
  }

  static final _linkExtracReg = RegExp(r'\[.*?\]\(.*?\)');
  static final _linkNameExtracReg = RegExp(r'\[.*\]');
  static final _linkUrlExtracReg = RegExp(r'\(.*\)');

  static final _linkRemoveBrackets = RegExp(r'\(|\)');
  static final _linkNameRemoveBrackets = RegExp(r'\[|\]');

////////////////// this regex casuing the problem
  static final _mediaTagReg = RegExp(
    r'(<a){0,1}\s{0,}(href=.*){0,}https:\/\/anilist\.co\/(anime|manga)\/\d+[^(\s|<|()|~]+(<\/a>){0,1}',
  );

  static String _replace1(final String html) {
    return html.replaceAllMapped(_linkExtracReg, (final e) {
      final match = html.substring(e.start, e.end);

      final linkMatch = _linkUrlExtracReg.firstMatch(match);
      final link = match
          .substring(linkMatch!.start, linkMatch.end)
          .replaceAll(_linkRemoveBrackets, '');

      final linkNameMatch = _linkNameExtracReg.firstMatch(match);
      final linkName = match
          .substring(linkNameMatch!.start, linkNameMatch.end)
          .replaceAll(_linkNameRemoveBrackets, '');

      return '<a href=\'$link\'>$linkName</a>';
    });
  }

  static String _replace2(final String html) {
    return html.replaceAllMapped(_mediaTagReg, (final m) {
      return '<custoummediatag>media id</custoummediatag>';
    });
  }
}
