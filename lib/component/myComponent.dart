import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class My_Divider extends StatelessWidget {
  const My_Divider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
            colors: GradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: [
            Text(
              tagList[index].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTags extends StatefulWidget {
  const SelectTags({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<SelectTags> createState() => _SelectTagsState();
}

class _SelectTagsState extends State<SelectTags> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: SolidColors.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedTags[widget.index].title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    selectedTags.removeAt(widget.index);
                  });
                },
                child: const Icon(
                  CupertinoIcons.delete_left_fill,
                  color: Colors.pink,
                )),
          ],
        ),
      ),
    );
  }
}

myLanchUrl(String url) async{
  var uri = Uri.parse(url);
  if(await canLaunchUrl(Uri.parse(url))){
    await launchUrl(uri);
  }
}


PreferredSize MyAppbar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: SolidColors.primeryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: SolidColors.primeryColor.withAlpha(200),
            shape: BoxShape.circle,
          ),
          child: Icon(CupertinoIcons.arrow_right,size: 30,),
        ),
      ),
    ),
  );
}










class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primeryColor,
      size: 32.0,
    );
  }
}