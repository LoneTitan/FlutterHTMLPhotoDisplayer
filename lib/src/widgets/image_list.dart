import "package:flutter/material.dart";
import "../models/image_model.dart";

class ImageList extends StatelessWidget{
  final List<ImageModel> images;
  ImageList(this.images);


  Widget build(context){
    return ListView.builder(itemCount : images.length,
                            itemBuilder: (context, index){
                              return buildImage(images[index]);
                                                    
                            }
                          );
  }



  Widget buildImage(ImageModel image){

      return Container(
                                child : Column(
                                  children: <Widget>[
                                    Padding(
                                      child: Image.network(image.url),
                                      padding: EdgeInsets.only(bottom : 12)),
                                  

                                      
                                      Text(image.title),

                                  ],

                                  
                                ),
                                margin : EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10), 
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey
                                  )
                                  )
                                
                              );



  }


}