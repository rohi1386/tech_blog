import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/myComponent.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:tech_blog/view/my_cat.dart';
import 'package:validators/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class MyCatSelected extends StatefulWidget{
  @override
  State<MyCatSelected> createState() => _MyCatSelectedState();
}

class _MyCatSelectedState extends State<MyCatSelected> {
  @override
  Widget build(BuildContext context) {
   return SafeArea(child:
       Scaffold(
         body:
         SingleChildScrollView(
           physics: BouncingScrollPhysics(),
           child: Padding(
             padding: const EdgeInsets.only(left: 20 , right: 20 , top: 40),
             child: Column(
               // mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SvgPicture.asset(
                   'assets/img/bot_tech.svg',
                   height: 100,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 16),
                   child:
                   RichText(
                     textAlign: TextAlign.center,
                     text: const TextSpan(
                       text: MyStrings.successfulRegistration,
                       style: TextStyle(
                         color: Colors.black54,
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                         fontFamily: 'IranSans',
                         height: 2,
                       ),
                     ),
                   ),
                 ),
                 TextField(
                   onChanged: (value) {
                   },
                   textAlign: TextAlign.center,

                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     alignLabelWithHint: true,
                     hintText: "نام و نام خانوادگی...",
                     prefixIcon: Icon(CupertinoIcons.circle_grid_3x3),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(16),
                       borderSide: BorderSide(width: 2),
                     ),
                     hintStyle: TextStyle(color: Colors.black26),
                   ),
                 ),

                 const SizedBox(height: 20,),
                 const Text(MyStrings.chooseCats,style: TextStyle(
                   fontSize: 12,
                   fontWeight: FontWeight.bold,
                 ),),
                 SizedBox(height: 20,),



                 SizedBox(
                   width: double.infinity,
                   height: 100,
                   child: GridView.builder(
                     physics: ClampingScrollPhysics(),
                     shrinkWrap: true,
                       itemCount: tagList.length,
                       scrollDirection: Axis.horizontal,
                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                         crossAxisSpacing: 5,
                         mainAxisSpacing: 5,
                         childAspectRatio: 0.3

                       ),
                       itemBuilder: (context, index) {
                         return InkWell(
                           onTap: () {
                             setState(() {
                               if(!selectedTags.contains(tagList[index])){
                                 selectedTags.add(tagList[index]);
                               }else{

                               }

                             });
                           },
                           child: Container(
                             child: MainTags(index: index),
                           ),
                         );
                       },
                   ),
                 ),








                 Divider(),

                 SizedBox(
                   width: double.infinity,
                   height: 100,
                   child: GridView.builder(
                     physics: ClampingScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: selectedTags.length,
                     scrollDirection: Axis.horizontal,
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         crossAxisSpacing: 5,
                         mainAxisSpacing: 5,
                         childAspectRatio: 0.3

                     ),
                     itemBuilder: (context, index) {
                       return Container(
                         child: SelectTags(index: index),
                       );
                     },
                   ),
                 ),

               ],
             ),
           ),
         ),

       )
   );
  }
}