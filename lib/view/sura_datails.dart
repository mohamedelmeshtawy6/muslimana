// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:evry_thing/constant/my_colors.dart';
import 'package:evry_thing/constant/my_strings.dart';
import 'package:evry_thing/datalayer/model/sura_detailsmodel.dart';

class SuraDetailsPage extends StatefulWidget {
  int number;
  int sound;

  SuraDetailsPage({
    Key? key,
    required this.number,
    required this.sound,
  }) : super(key: key);

  @override
  State<SuraDetailsPage> createState() => _SuraDetailsPageState();
}

class _SuraDetailsPageState extends State<SuraDetailsPage> {
  bool playing = false;
  Dio dio = Dio();

  Future<SuraDetailsModel> getdata() async {
    dynamic data =
        await dio.get("https://equran.id/api/v2/surat/${widget.number}");
    return /*SuraDetailsModel.fromJson(json.decode(data.toString()));*/ suraDetailsModelFromJson(
        data.toString());
  }

  AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.STOPPED;

  Future<void> playy(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  /*Future<void> playSuraAudio(SuraDetailsModel suraDetailsModel) async {
    if (suraDetailsModel.data.audioFull.isNotEmpty) {
      String audioUrl = suraDetailsModel.data.audioFull['01'];
      final response = await dio.get(audioUrl);
      if (response.statusCode == 200) {
        int result = await audioPlayer.play(response);
        if (result == 1) {
          // success
        }
      }
    }
  }*/

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: MyColors.background1,
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )),
            );
          }
          SuraDetailsModel suraDetailsModel = snapshot.data!;
          return Scaffold(
            backgroundColor: MyColors.background1,
            appBar: _appBar(suraDetailsModel),
            body: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxScroller) => [
                        SliverToBoxAdapter(
                          child: Stack(children: [
                            Container(
                                height: 275.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0,
                                          1
                                        ],
                                        colors: [
                                          MyColors.shapegrade1,
                                          MyColors.shapegrade2
                                        ]))),
                            Positioned(
                                bottom: 20.h,
                                right: 0,
                                child: Opacity(
                                  opacity: .3,
                                  child: SvgPicture.asset(
                                    width: 280.w,
                                    fit: BoxFit.fill,
                                    'assets/svg/quran.svg',
                                  ),
                                )),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${suraDetailsModel.data.nama}',
                                        style: textstyle(
                                            color: MyColors.textWhite,
                                            size: 30.sp,
                                            weight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      Divider(
                                        color: MyColors.textGrey,
                                        height: 3,
                                        thickness: 1,
                                        indent: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${suraDetailsModel.data.tempatTurun}',
                                            style: textstyle(
                                                color: MyColors.textWhite,
                                                size: 20.sp),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            width: 4.w,
                                            height: 4.h,
                                            decoration: BoxDecoration(
                                                color: MyColors.textGrey,
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            '${suraDetailsModel.data.jumlahAyat}  verses',
                                            style: textstyle(
                                                color: MyColors.textWhite,
                                                size: 20.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 60.h,
                                      ),
                                      widget.number == 9
                                          ? Container()
                                          : SvgPicture.asset(
                                              width: 200.w,
                                              fit: BoxFit.fill,
                                              'assets/svg/basmal.svg')
                                    ]),
                              ),
                            )
                          ]),
                        ),
                      ],
                  body: ListView.separated(
                      itemBuilder: ((context, index) => widget.number == 1
                          ? ayaDetail(
                              suraDetailsModel.data.ayat.elementAt(index + 1))
                          : ayaDetail(
                              suraDetailsModel.data.ayat.elementAt(index))),
                      separatorBuilder: (context, inf) => Divider(
                            color: MyColors.textGrey,
                            height: 3,
                            thickness: 1,
                            indent: 10,
                          ),
                      itemCount: widget.number == 1
                          ? suraDetailsModel.data.jumlahAyat - 1
                          : suraDetailsModel.data.jumlahAyat)),
            ),
          );
        }));
  }

  Widget ayaDetail(Ayat ayat) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 47.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff121931)),
              child: Row(
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${ayat.nomorAyat}',
                        style: textstyle(color: Colors.white, size: 15.sp),
                      ),
                    ),
                    width: 27.w,
                    height: 27.h,
                    decoration: BoxDecoration(
                        color: MyColors.Primary,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        playy(ayat.audio['0${widget.sound}']!);
                      },
                      child: SvgPicture.asset('assets/svg/play.svg')),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(ayat.teksArab,
                style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(ayat.teksLatin,
                style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp)),
          ),
        ],
      );

  AppBar _appBar(SuraDetailsModel suraDetailsModel) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: MyColors.background1,
      title: Row(
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                size: 40,
                Icons.arrow_back,
                color: MyColors.textGrey,
              )),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Text(
              "${suraDetailsModel.data.namaLatin}",
              style: textstyle(
                  color: MyColors.textWhite,
                  size: 20.sp,
                  weight: FontWeight.bold),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                size: 40,
                Icons.search,
                color: MyColors.textGrey,
              ))
        ],
      ),
    );
  }
}

enum PlayerState { STOPPED, PLAYING, PAUSED }
