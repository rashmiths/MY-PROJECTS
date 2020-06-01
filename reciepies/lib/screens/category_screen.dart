import 'package:flutter/material.dart';
import '../dummy_categories.dart';
import '../widgets/categoryitem.dart';


class CategoryScreen extends StatelessWidget {

  // final String id,title;
  // CategoryScreen(this.id,this.title);
  static const routename='\CategoryScreen';
  

  @override
  Widget build(BuildContext context) {
    
    return 
         GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (ctxt, index) {
            return CategoryItem(
               DUMMY_CATEGORIES[index].id ,DUMMY_CATEGORIES[index].title, DUMMY_CATEGORIES[index].color);
          },
          itemCount: DUMMY_CATEGORIES.length,
        );
      
  
  }
}
