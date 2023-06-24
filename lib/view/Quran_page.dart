import 'package:evry_thing/constant/my_colors.dart';
import 'package:evry_thing/constant/my_strings.dart';
import 'package:evry_thing/view/qurantabs/hijb_tab.dart';
import 'package:evry_thing/view/qurantabs/page_tab.dart';
import 'package:evry_thing/view/qurantabs/para_tab.dart';
import 'package:evry_thing/view/qurantabs/sura_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  int? _selectedValue = 1;

  // int? _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      backgroundColor: MyColors.background1,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: MyColors.background1,
        title: Text(
          "Quran",
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxScroller) => [
                    SliverToBoxAdapter(child: sliverHide()),
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: MyColors.background1,
                      elevation: 0,
                      shape: Border(
                          bottom: BorderSide(
                              color: const Color(0xffaaaaaa).withOpacity(.1))),
                      bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: TabBar(
                              indicatorColor: MyColors.Primary,
                              indicatorWeight: 3.sp,
                              unselectedLabelColor: MyColors.textGrey,
                              labelColor: MyColors.textWhite,
                              tabs: [
                                _tab('surah'),
                                _tab('Para'),
                                _tab('page'),
                                _tab('Hijb'),
                              ])),
                    )
                  ],
              body: TabBarView(
                children: [
                  SuraTabPage(sound: _selectedValue!),
                  ParaTabPage(),
                  PageTabPage(),
                  HijbTabPage()
                ],
              )),
        ),
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      width: 200.w,
      backgroundColor: MyColors.background1,
      child: SafeArea(
        child: ListView(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(BorderSide.none),
                boxShadow: [BoxShadow(color: MyColors.background1)],
                gradient: LinearGradient(
                    stops: [0, .6, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      MyColors.background1,
                      MyColors.background2,
                      MyColors.background3,
                    ]),
              ),
              child: Center(
                child: Text('Evry Thing',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: MyColors.textWhite,
                        fontSize: 20.sp,
                        letterSpacing: 1.w)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Get.back();
                  // Navigate to home page
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.rate_review),
                title: Text('Rate'),
                onTap: () async {
                  Uri url = Uri.parse('https://github.com/mohamedelmeshtawy6');
                  if (await launchUrl(url)) {
                    await launch(url.toString());
                  }
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              child: ListTile(
                  leading: Icon(Icons.record_voice_over),
                  title: DropdownButton(
                    isExpanded: true,
                    dropdownColor: MyColors.background1,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                    hint: Text('sound'),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'عبدلله الجهني',
                          style: _selectedValue == 1
                              ? sondchoose()
                              : sondnotchoose(),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('عبدالمحسن القاسم ',
                            style: _selectedValue == 2
                                ? sondchoose()
                                : sondnotchoose()),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('عبدالرحمن السديس',
                            style: _selectedValue == 3
                                ? sondchoose()
                                : sondnotchoose()),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('ابراهيم الدوسرى ',
                            style: _selectedValue == 4
                                ? sondchoose()
                                : sondnotchoose()),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text('مشاري راشد',
                            style: _selectedValue == 5
                                ? sondchoose()
                                : sondnotchoose()),
                        value: 5,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Tab _tab(String name) {
    return Tab(
      child: Text(
        name,
        style: textstyle(size: 16.sp),
      ),
    );
  }
}

Column sliverHide() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        textAlign: TextAlign.end,
        'صل على النبى',
        style: GoogleFonts.poppins(
            color: MyColors.textGrey,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 4.h,
      ),
      Text(
        textAlign: TextAlign.start,
        'Mohamed Elmeshtawy',
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 10.h,
      ),
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 131.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      MyColors.shapegrade1,
                      MyColors.shapegrade2,
                      MyColors.shapegrade3
                    ],
                    stops: [
                      0,
                      .6,
                      1
                    ])),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                  width: 206.w,
                  height: 126.h,
                  child: SvgPicture.asset(
                    'assets/svg/quran.svg',
                    fit: BoxFit.fill,
                  ))),
          Positioned(
              top: 10.h,
              left: 19.w,
              child: SizedBox(
                  width: 107.w,
                  height: 117.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/sura.svg'),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'last Read',
                            style: textstyle(
                                color: Colors.white,
                                size: 15.sp,
                                weight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Al-Fatiha',
                        style: textstyle(
                            color: MyColors.textWhite,
                            size: 18.sp,
                            weight: FontWeight.normal),
                      ),
                      Text(
                        'Ayah No: 1',
                        style: textstyle(
                            color: MyColors.textGrey,
                            size: 14.sp,
                            weight: FontWeight.normal),
                      )
                    ],
                  )))
        ],
      )
    ],
  );
}
