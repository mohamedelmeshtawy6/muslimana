// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:evry_thing/constant/my_colors.dart';
import 'package:evry_thing/constant/my_strings.dart';
import 'package:evry_thing/datalayer/model/suras_model.dart';
import 'package:evry_thing/view/sura_datails.dart';

import '../../viewmodel/sura_tab_viewmodel.dart';

class SuraTabPage extends GetView<SuraTabViewModel> {
  int sound;
  SuraTabPage({
    required this.sound,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getdata(),
        initialData: [],
        builder: (context, snap) {
          if (!snap.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) =>
                  suraItem(snap.data!.elementAt(index)),
              separatorBuilder: (context, index) =>
                  Divider(color: Color(0xffaaaaaaa).withOpacity(.36)),
              itemCount: snap.data!.length);
        });
  }

  Widget suraItem(SuraModel suraModel) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.to(() => SuraDetailsPage(
              number: suraModel.nomor,
              sound: sound,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              symbol(suraModel),
              SizedBox(
                width: 24.w,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${suraModel.namaLatin}',
                    style: textstyle(
                        color: Colors.white,
                        size: 16.sp,
                        weight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '${suraModel.tempatTurun.name}',
                        style: textstyle(
                            color: MyColors.textGrey,
                            size: 12.sp,
                            weight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        width: 4.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: MyColors.textGrey),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '${suraModel.jumlahAyat} Ayat',
                        style: textstyle(
                            color: MyColors.textGrey,
                            size: 12.sp,
                            weight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              )),
              Text(
                suraModel.nama,
                style: textstyle(
                    color: MyColors.Primary,
                    size: 20.sp,
                    weight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}

Widget symbol(SuraModel suraModel) {
  return Text(
    "\uFD3E" + '${suraModel.nomor}' + "\uFD3F",
    style: GoogleFonts.poppins(
        color: MyColors.Primary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        shadows: [
          Shadow(
            offset: Offset(.5, .5),
            blurRadius: 1.0,
            color: Colors.amberAccent,
          ),
        ]),
  );
}
