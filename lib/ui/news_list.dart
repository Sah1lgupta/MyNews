
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pingolearn/api/news_api.dart';
import 'package:pingolearn/datamodels/news_model.dart';


import '../resources/custom_colors.dart';

import '../widgets/news_card.dart';







class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {



  List<Articles>? articles=null;




  @override
  void setState(VoidCallback fn) {
   articles;
    super.setState(fn);
  }







  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.litegray,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text('Top Headlines',style: TextStyle(fontSize: 16,fontFamily: 'Poppins',color: CustomColors.darkgray,fontWeight: FontWeight.bold),),
                ],
              ),
             // SizedBox(height: 5,),
              Container(
               width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.84,
                child: FutureBuilder(future: NewsApiService.fetchNews(),builder: (BuildContext context, AsyncSnapshot<List<Articles>> snapshot){


                  if(snapshot.hasData){

                    articles = snapshot.data;


                    return  ListView.builder(
                      itemCount: articles!.length,
                      itemBuilder: (context, index) => customListTile(articles![index]),


                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },),
              ),
            ],
          ),
        ),
      ),
    );

      /***
      loading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];
        return ListTile(
          leading: Image.network(news.imageUrl),
          title: Text(news.title),
          subtitle: Text(news.description),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailScreen(url: news.status),
              ),
            );
          },
        );
      },

    );

    ***/
  }
}
