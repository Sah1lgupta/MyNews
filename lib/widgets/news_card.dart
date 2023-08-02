

import 'package:flutter/material.dart';
import '../datamodels/news_model.dart';




  Widget customListTile(Articles? articles) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(

                  height: 160,
                  width: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      articles!.title != null ?   Text('${articles.title}',style: TextStyle(fontWeight: FontWeight.bold),) :  Text('no result',style: TextStyle(fontWeight: FontWeight.bold),),

                      SizedBox(height: 10,),

                      articles.description != null ?   Text('${articles.description}',maxLines: 4,style: TextStyle(fontWeight: FontWeight.normal),) :  Text('no result',style: TextStyle(fontWeight: FontWeight.normal),),
                    ],
                  ),
                ),
              ),

            SizedBox(width: 15,),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 125,
                  height: 125,


                  child:   articles.urlToImage != null ? Image.network(articles.urlToImage!, fit: BoxFit.cover, ) :Image.network("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8OEAkQEAgLCgkLBwoHDQ0NBxAICggNIB0iFiAdHx8kHCggJBolGx8fITEhJSkrLi4uFx8zODMtNygtLisBCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAMgAyAMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAAAwQBAgUGB//EAD8QAAICAQIBBwgIBQMFAAAAAAECAAMEERITBSEiMUFRYRQjMlJxgZGSBhUzQmKhscEkQ1NyskSCojRUZMLR/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/APuMREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERATzvKnKlyNlaW0Y64vDuVGG+zPB7B3a845tTrPRSu+LWzJY1KNai6K7VhmQeBgSU2B1RgCAyK4BGjDWSREBERAREQEREBERAREQEREBESK+zapPb1CBi68L4t3So+Sx7do8JGTrrz6kzEDbiN67fNHEb12+aayLIyEqV3ewV1ou4sYE/Eb12+aVsrlOunTiZS1k9Sl+k3u65TrTIy+fc2DhnqPo5N6/+o/P2STbg4XPtrWw/eduLdc36mA+vVPoU5to70wX2/npMHlzT0sbOrHe2C7L+Wsz9fE/Z8n5di9jLhrWrfMRH1449Pk3LRe/yVb1/wCJMCbF5XptOiZas/ql+HZ8Dzy3xG9dvmnOORhZgKlKbbB91l4d1fuPOJCca/G56XbKxx149r7rlX8DfsYHX4jeu3zRxG9dvmlXCzEuXcjHmbaysu2ylu4jsMsQNuI3rt80cRvXb5prpzdY13bdIgbcRvXb5pumSw7dw8ZFEDoU3hvBu6TTlA6ac+hE6FFm5Qe3qMCWIiAiIgIiICUc1ucDsCy9KGaOl7VgUM42bG4f2u6vT+3Ua/lrLEhy6eIlqbihsqasMPut3xjOGVemthXzbMvo7xzH84EljhQzMwVFXczH0VWc7Ao8qZci4EYyNuxqG/zI7z2dwjlN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rcMAQeY/MpgdvkLPbHcYl5IXdw6HZvR/AT+hnp55HauZXscgZla+bb0eMo7PbOj9HuVWfWi4kZda9Fm6PlKDt9o7YHdiIgJ1E6l9koY1e4j1R0jOjAREQEREBERAREQI7wCG5tdBrObOqROfdSVJ5tV7DAiI+BkWPjrUoVE2oOlp6UliAiIgIiIG9TKN2q7tV5ppEQE8t9JOSuGXyKk1rbpXoq+j+MfvPUzBGuvNqD1gwPA1vptZW0I6SsGnRvTypRajcPlCjzh2+lZp94fuJDy1yZ5I+5VPkVr83/iOez2HslWqxkIKuUcdRDQPVchcqjJQhgEyqujan7jwM6k8FiWMl+G6E8RsquggfzEJ5wf190+hU0liObRe0wLtAAC82mo1kkwBMwEREBERAREQEREBERAxtHcPhMbR3D5ZtEDXaO4fLG0dw+WbRA12juHyxtHcPlm0QNdo7h8sbR3D5ZtEDXaO4fLG0dw+WbRAhycZLUdHrV63QoykekJ4XL+i2XUzLUi5VG7zbNeK7Kx3Nr+on0CIHm/o99GxQRdcVuzNvR0+yxh3L4+M9JEQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERA//Z",fit: BoxFit.fill,),


                ),
              ),


            ],
          ),
        ),

      ),
    );
  }








//Container(
//
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//
//                     ),
//                     child:  articles!.title != null ?   Text('${articles.title}',style: TextStyle(fontWeight: FontWeight.bold),) :  Text('no result',style: TextStyle(fontWeight: FontWeight.bold),),
//                   ),





//Container(
//
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//
//                     ),
//                     child:  articles.description != null ?   Text('${articles.description}',style: TextStyle(fontWeight: FontWeight.normal),) :  Text('no result',style: TextStyle(fontWeight: FontWeight.normal),),
//                   ),
