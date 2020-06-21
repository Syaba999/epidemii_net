import 'package:epidemiinet/models/html_page.dart';
import 'package:epidemiinet/widgets/expanded_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PreventiveItem extends StatelessWidget {
  final HtmlPage htmlPage;
  final bool opened;
  final Function() onTap;

  const PreventiveItem(
      {Key key,
      @required this.htmlPage,
      @required this.opened,
      @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            color: Theme.of(context).accentColor,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        htmlPage.title,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Icon(
                      opened
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ExpandedSection(
          expand: opened,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Html(
              data: htmlPage.text,
            ),
          ),
        )
      ],
    );
  }
}
