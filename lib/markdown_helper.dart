// To Do
// refactore to one methoud

extension MarkDownHelper on String {
  static final _centerDotReg = RegExp(r'(?<=<br>)\s{0,}-\s{1,}');

  String convertMarkDown() {
    var html = this;

    html = _replaceLink(html);
    html = _replaceImage(html);
    html = _center(html);
    html = _header(html);
    html = _youtube(html);
    html = _replaceBold(html);
    html = _strikeThrough(html);
    html = _webVideo(html);
    html = _line(html);
    html = _replaceItalic(html);
    html = _newLine(html);
    html = _quote(html);
    html = _nomination(html);
    html = _spoiler(html);
    html = html.replaceAll(_centerDotReg, '     ·  ');

    return html;
  }

  /////////////Images
  static final _imageExtracReg = RegExp(
    r'=?img.*?\(.*?\)',
    caseSensitive: false,
  );
  static final _imageLinkMatch = RegExp(r'(?<=\().*?(?=\s|\))');
  static final _imageWidthMatch = RegExp(r'(?<=img).*(?=\()');

  static String _replaceImage(final String html) {
    return html.replaceAllMapped(_imageExtracReg, (final e) {
      final match = html.substring(e.start, e.end);

      final imageUrlMatch = _imageLinkMatch.firstMatch(match);
      final imageUrl = match.substring(
        imageUrlMatch!.start,
        imageUrlMatch.end,
      );

      final imageWidthMatch = _imageWidthMatch.firstMatch(match);
      late final int? imageWidth;

      if (imageWidthMatch != null)
        imageWidth = int.tryParse(
          match.substring(imageWidthMatch.start, imageWidthMatch.end),
        );
      else
        imageWidth = null;

      if (imageWidth != null)
        return '<img src= $imageUrl width="$imageWidth" >';
      else
        return '<img src= $imageUrl >';
    });
  }
  /////////////Images

////////////////////////////////////////////////////////

  /////////////Links
  static final _linkExtracReg = RegExp(r'\[.*?\]\(.*?\)');
  static final _linkNameExtracReg = RegExp(r'\[.*\]');
  static final _linkUrlExtracReg = RegExp(r'\(.*\)');

  static final _linkRemoveBrackets = RegExp(r'\(|\)');
  static final _linkNameRemoveBrackets = RegExp(r'\[|\]');

  // Custoum Media tag
  static final _mediaTagReg = RegExp(
    r'(<a){0,1}\s{0,}(href=.*){0,}https:\/\/anilist\.co\/(anime|manga)\/\d+[^(\s|<|()|~]+(<\/a>){0,1}',
  );

  // ////
  static final _reg = RegExp(r'\/\d+\/');

  static int? _getMediaIdReg(final String mediaUrl) {
    final match = _reg.firstMatch(mediaUrl);

    if (match == null) return null;

    return int.tryParse(
      mediaUrl.substring(match.start, match.end).replaceAll('/', ''),
    );
  }

  static String _replaceLink(String html) {
    ///

    html = html.replaceAllMapped(_linkExtracReg, (final e) {
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

    //////////////// customu Media tag

    html = html.replaceAllMapped(_mediaTagReg, (final m) {
      final match = html.substring(m.start, m.end);
      final id = _getMediaIdReg(match);
      return '<custoummediatag>$id</custoummediatag>';
    });

    return html;
  }

  /////////////Links

////////////////////////////////////////////////////////

  /////////////Fonts
  /////////////Bold
  static final _boldReg = RegExp(r'__.*__');

  static String _replaceBold(final String html) {
    return html.replaceAllMapped(_boldReg, (final m) {
      final match = html.substring(m.start, m.end);

      return '<b>${match.replaceAll('__', '')}</b>';
    });
  }

  /////////////Italic

  static final _italicReg = RegExp(r'_{1}.*?_{1}|\*{1}.*?\*{1}');
  static final _italicRegRemove = RegExp(r'_|\*');

  static final _skipItlicReg = RegExp(
    r'<img.*?>|<a href=.*?<\/a>|<mycustoumyoutube>.*?<\/mycustoumyoutube>|<video controls>.*?<\/video>',
  );

  static String _replaceItalic(String html) {
    final skipedHtml = html.replaceAll(_skipItlicReg, '');

    final italicMatches = _italicReg.allMatches(skipedHtml);

    for (final m in italicMatches) {
      final match = skipedHtml.substring(m.start, m.end);
      html = html.replaceFirst(
        match,
        '<i>${match.replaceAll(_italicRegRemove, '')}</i>',
      );
    }

    return html;
  }
  /////////////Fonts

  ////////////////////////////////////////////////////////

  /////////////Center
  static final _centerReg = RegExp(r'~{3}(\n|.)*?~{3}|\+{3}(\n|.)*?\+{3}');
  static final _centerRemoveReg = RegExp(r'~{3}|\+{3}');

  static String _center(final String html) {
    return html.replaceAllMapped(_centerReg, (final m) {
      final match = html.substring(m.start, m.end);
      return '<center>${match.replaceAll(_centerRemoveReg, '')}</center>';
    });
  }
  /////////////Center

  ////////////////////////////////////////////////////////

  /////////////spoiler
  static final _spoilerReg = RegExp(r'~!.*?!~');
  static final _spoilerReplaceReg = RegExp(r'~!|!~');

  static String _spoiler(final String html) {
    return html.replaceAllMapped(_spoilerReg, (final m) {
      final match = html.substring(m.start, m.end);
      return '<anilistspoiler>${match.replaceAll(_spoilerReplaceReg, '')}</anilistspoiler>';
    });
  }

  /////////////spoiler

  ////////////////////////////////////////////////////////

  /////////////header
  static final _headerReg = RegExp(r'[^\s].*\n{1}?={2,}');

  static final _headerReg2 = RegExp(r'\\n\s{0,}#.*?\\n{0,1}');
  static final _headerRemoveReg = RegExp(r'={2,}');

  static String _header(String html) {
    html = html.replaceAllMapped(_headerReg2, (final m) {
      final match = html.substring(m.start, m.end);
      return '<h1>${match.replaceFirst('#', '')}</h1>';
    });

    html = html.replaceAllMapped(_headerReg, (final m) {
      final match = html.substring(m.start, m.end);
      return '<h1>${match.replaceAll(_headerRemoveReg, '')}</h1>';
    });

    return html;
  }
  /////////////header

  ////////////////////////////////////////////////////////

  /////////////line

  ///      Should run after _header function
  static final _lineReg = RegExp(
    r'(^-{3,}[\r\n]+|\*{3,}[\r\n]+|_{3,}$)|(^(-\s{0,}){3,}$)|(^(_{1,}\s{0,3}){3,}$)',
    multiLine: true,
  );

  static String _line(final String html) {
    return html.replaceAllMapped(_lineReg, (final m) => '<hr>');
  }
  ///////////line

  ////////////////////////////////////////////////////////

  /////////////strikeThrough
  static final _strikeThroughReg = RegExp(r'~~[^(~\s)].*?[^\s]~~');

  static String _strikeThrough(final String html) {
    return html.replaceAllMapped(_strikeThroughReg, (final m) {
      final match = html.substring(m.start, m.end);
      return '<del>${match.replaceAll('~~', '')}</del>';
    });
  }
  /////////////strikeThrough

  ////////////////////////////////////////////////////////

  /////////////youtube

  static final _youtubeReg = RegExp(r'youtube\(.*?\)');

  static final _extractyoutubeData = RegExp(r'(?<=youtube\().*?\)');

  static final _youtubeWatchIdMatch = RegExp(
    r'(?<=https:\/\/(www|m)\.youtube\.com\/watch\?v=).*?(?=&|\))',
  );

  static final _youtuDotBeWatchIdMatch = RegExp(
    r'(?<=http(s{0,1}):\/\/youtu\.be\/).*?(?=\)|\?|&)',
  );

  static String _youtube(final String html) {
    return html.replaceAllMapped(_youtubeReg, (final m) {
      final match = html.substring(m.start, m.end);

      final youtubeDataMatch = _extractyoutubeData.firstMatch(match);

      final youtubeData = match.substring(
        youtubeDataMatch!.start,
        youtubeDataMatch.end,
      );

      late final String youtubeLink;

      if (youtubeData.contains("watch?v")) {
        final idMatch = _youtubeWatchIdMatch.firstMatch(youtubeData);

        if (idMatch != null) {
          final link = youtubeData.substring(idMatch.start, idMatch.end);

          youtubeLink = '<mycustoumyoutube>$link</mycustoumyoutube>';
        } else {
          youtubeLink = '<mycustoumyoutube></mycustoumyoutube>';
        }
      } else if (youtubeData.contains('youtu.be')) {
        final idMatch = _youtuDotBeWatchIdMatch.firstMatch(youtubeData);

        if (idMatch != null) {
          final link = youtubeData.substring(idMatch.start, idMatch.end);

          youtubeLink = '<mycustoumyoutube>$link</mycustoumyoutube>';
        } else {
          youtubeLink = '<mycustoumyoutube></mycustoumyoutube>';
        }
      } else {
        youtubeLink =
            '<mycustoumyoutube>${youtubeData.replaceAll(")", '')}</mycustoumyoutube>';
      }

      return youtubeLink;
    });
  }

  /////////////youtube

  ////////////////////////////////////////////////////////

  /////////////webVideo
  static final _webVideoReg = RegExp(r'webm\(.*?\)');
  static final _webVideoRemoveReg = RegExp(r'webm\(|\)');

  static const _types = [
    'mp4',
    'webm',
    'ogg',
  ];

  static String _webVideo(final String html) {
    return html.replaceAllMapped(_webVideoReg, (final m) {
      late final String type;

      final match = html.substring(m.start, m.end);

      final videoLink = match.replaceAll(_webVideoRemoveReg, '');

      if (videoLink.endsWith(_types[1]))
        type = _types[1];
      else if (videoLink.endsWith(_types[2]))
        type = _types[2];
      else
        type = _types[0];

      return '<video controls> <source src="$videoLink" type="video/$type"></video>';
    });
  }
  /////////////webVideo

  ////////////////////////////////////////////////////////

  /////////////quote
  static final _quoteReg = RegExp(r'(<br>){1,2}>.*?((<br>){2}|(<br>){0,1}$)');
  static final _quoteRemoveLineReg = RegExp(r'^((<br>){2})', multiLine: true);

  static String _quote(final String html) {
    return html.replaceAllMapped(_quoteReg, (final m) {
      final match = html.substring(m.start, m.end);

      String newValue = match.replaceFirst('&gt;', '');
      newValue = newValue.replaceAll(_quoteRemoveLineReg, '');
      newValue = newValue.replaceFirst('>', '');

      return '<anilistquote><i>$newValue</i></anilistquote>';
    });
  }
  /////////////quote

  ////////////////////////////////////////////////////////

  /////////////nomination
  static final _nominationReg = RegExp(r'@\w+');

  static String _nomination(final String html) {
    return html.replaceAllMapped(
      _nominationReg,
      (final match) {
        return '<nomination>${html.substring(match.start, match.end)}</nomination>';
      },
    );
  }
  /////////////quote

  ////////////////////////////////////////////////////////

  /////////////NewLine

  static String _newLine(final String html) => html.replaceAll('\n', '<br>');
  /////////////NewLine
}
