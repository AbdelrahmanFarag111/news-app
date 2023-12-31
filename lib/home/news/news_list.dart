import 'package:flutter/material.dart';
import 'package:projects/api/api_manager.dart';
import 'package:projects/api/model/NewsResponse.dart';
import 'package:projects/api/model/SourcesResponse.dart';

import 'news_widget.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
            future: ApiManager.getNews(sourceId: source.id ?? ''),
            builder: (_, snapShot) {
              if (snapShot.hasError) {
                return Center(child: Text('${snapShot.error.toString()}'));
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapShot.data;
              if ('error' == data?.status) {
                return Center(child: Text('${data?.message}'));
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return NewsWidget((data?.newsList![index])!);
                  },
                  itemCount: data?.newsList?.length ?? 0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
